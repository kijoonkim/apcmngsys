<%
/**
 * @Class Name : gdsWrhs.jsp
 * @Description : 상품입고등록 화면
 * @author SI개발부
 * @since 2023.08.31
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.08.31   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 상품입고등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 상품입고등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="srch-inp-pckgno" name="srch-inp-pckgno" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-pckgSn" name="srch-inp-pckgSn" uitype="hidden"></sbux-input>
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
						<col style="width: 5%">
						<col style="width: 1%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgYmd" name="srch-dtp-pckgYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast input-sm inpt_data_reqed"></sbux-datepicker>
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
							<th scope="row" class="th_bg"><span class="data_required"></span>매입처</th>
						    <td class="td_input" style="border-right:hidden ;">
						    	<sbux-input id="srch-inp-prchsptNm" name="srch-inp-prchsptNm" uitype="text" class="form-control input-sm-ast inpt_data_reqed input-sm" maxlength="33"></sbux-input>
						    </td>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td colspan="2"></td>
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
											jsondata-value="itemVrtyCd"
											onchange="fn_onChangeSrchVrtyCd(this)"
										/>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>수량/중량</th>
							<td colspan="4" class="td_input"style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-pckgQntt" name="srch-inp-pckgQntt" class="form-control input-sm-ast inpt_data_reqed input-sm" maxlength="6" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" onchange="fn_onChangeQnttWght"/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghtAvg" name="srch-inp-wghtAvg" class="form-control input-sm" placeholder="평균" disabled/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-pckgWght" name="srch-inp-pckgWght" maxlength="7" class="form-control input-sm-ast inpt_data_reqed input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" onchange="fn_onChangeQnttWght"/>
							</td>
							<td colspan="3">
								<sbux-label uitype="normal" id="srch-lbl-chc" name="srch-lbl-chc" class="blod" text="Kg"/>
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm-ast inpt_data_reqed input-sm" jsondata-ref="jsonApcSpcfct"></sbux-select>
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>출하포장단위</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spmtPckgUnitCd" name="srch-slt-spmtPckgUnitCd" class="form-control input-sm-ast inpt_data_reqed input-sm" jsondata-ref="jsonSpmtPckgUnitCd"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>창고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm-ast inpt_data_reqed input-sm" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td colspan="9"></td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" maxlength="333" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>등급</th>
							<td colspan="24" class="td_input">
								<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>상품입고내역</span>
							<span style="font-size:12px">(기준일자 :
								<sbux-label
									id="crtr-ymd"
									name="crtr-ymd"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label>)
							</span>
						</li>
					</ul>
				</div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-grdGdsWrhs" style="height:508px;"></div>
                </div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
	</section>
    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonApcItem				= [];	// 품목 			itemCd			검색
	var jsonApcVrty				= [];	// 품종 			vrtyCd			검색
	var jsonApcSpcfct			= [];	// 규격 			spcfcCd			검색
	var jsonComBx				= [];	// 박스 			pltBxCd			검색
	var jsonComWarehouseSeCd	= [];	// 창고 			warehouse		검색
	var jsonSpmtPckgUnitCd		= [];	// 출하포장단위		spmtPckgUnitCd	검색

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
	}

	const fn_init = async function() {
		fn_createGdsWrhsGrid();

		SBUxMethod.set("srch-dtp-pckgYmd", gfn_dateToYmd(new Date()));

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_initSBRadio()
			]);

		fn_reset();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
        fn_search();
	});

	function fn_createGdsWrhsGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGdsWrhs';
	    SBGridProperties.id = 'grdGdsWrhs';
	    SBGridProperties.jsonref = 'jsonGdsWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
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
	        {caption: ["입고번호"],	ref: 'pckgno',      	type: 'output',  width: '110px',    style: 'text-align: center', 	sortable: false},
	        {caption: ["입고일자"],	ref: 'pckgYmd',     	type: 'output',  width: '105px',    style: 'text-align: center', 	sortable: false,
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["상품구분"],	ref: 'gdsSeNm',      	type: 'output',  width: '80px',    	style: 'text-align: center', 	sortable: false},
	        {caption: ["품목"],		ref: 'itemNm',      	type: 'output',  width: '105px',    style: 'text-align: center', 	sortable: false},
	        {caption: ["품종"],		ref: 'vrtyNm',      	type: 'output',  width: '105px',    style: 'text-align: center', 	sortable: false},
	        {caption: ["매입처"],		ref: 'prchsptNm',		type: 'output',  width: '140px',    style: 'text-align: center', 	sortable: false},
	        {caption: ["수량"],		ref: 'pckgQntt',		type: 'output',  width: '60px',    	style: 'text-align: right', 	sortable: false,
	        	format : {type:'number', rule:'#,###'}},
	        {caption: ["중량 (Kg)"],		ref: 'pckgWght',		type: 'output',  width: '80px',    	style: 'text-align: right',		sortable: false,
	        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### '}},
	        {caption: ["창고"],		ref: 'warehouseSeNm',	type: 'output',  width: '140px',    style: 'text-align: center',	sortable: false},
	        {caption: ["비고"],		ref: 'rmrk',      		type: 'output',  width: '300px', 									sortable: false},
	        {caption: ["순번"],		ref: 'pckgSn',			hidden: true},
	        {caption: ["상품구분코드"],	ref: 'pckgSeCd',		hidden: true},
	        {caption: ["품목코드"],	ref: 'itemCd',			hidden: true},
	        {caption: ["품종코드"],	ref: 'vrtyCd',			hidden: true},
	        {caption: ["규격코드"],	ref: 'spcfctCd',		hidden: true},
	        {caption: ["창고구분코드"],	ref: 'warehouseSeCd',	hidden: true},
	        {caption: ["매입처코드"],	ref: 'cnptCd',			hidden: true},
	        {caption: ["등급"],		ref: 'gdsGrd',			hidden: true},
	        {caption: ["출하포장단위"],	ref: 'spmtPckgUnitCd',	hidden: true}
	    ];
	    grdGdsWrhs = _SBGrid.create(SBGridProperties);
	    grdGdsWrhs.bind( "afterpagechanged" , "fn_pagingGdsWrhs" );
	    grdGdsWrhs.bind( "click", "fn_view" );
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
    	grdGdsWrhs.exportLocalExcel("상품입고", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdGdsWrhs.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdGdsWrhs.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdGdsWrhs.setColHidden(grdGdsWrhs.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdGdsWrhs.getFixedCols(); i < grdGdsWrhs.getCols()-1; i++) {
   			grdGdsWrhs.setColHidden(i, false);
    	}
   	}

	// 상품입고 목록 조회 (조회 버튼)
    async function fn_search() {

		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-pckgYmd"))){
			gfn_comAlert("W0002", "입고일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		
    	fn_clearInptForm();

    	let recordCountPerPage = grdGdsWrhs.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdGdsWrhs.movePaging(currentPageNo);
    }

	let newJsonGdsWrhs = [];

	// 상품입고 목록 조회 호출
	async function fn_callSelectGdsWrhsList(recordCountPerPage, currentPageNo){
		jsonGdsWrhs = [];
		let apcCd = gv_selectedApcCd;
		let pckgYmd = SBUxMethod.get("srch-dtp-pckgYmd");

		let gdsInvntrVO = {apcCd 				: apcCd
						 , pckgYmd 				: pckgYmd
						 , pagingYn 			: 'Y'
						 , currentPageNo 		: currentPageNo
						 , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/wrhs/selectGdsWrhsList.do", gdsInvntrVO);
        let data = await postJsonPromise;
        newJsonGdsWrhs = [];
        try{
        	if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
        	
        	data.resultList.forEach((item, index) => {
				let gdsWrhs = {
					pckgno 			: item.pckgno
				  , pckgYmd 		: item.pckgYmd
				  , gdsSeNm 		: item.gdsSeNm
				  , itemNm 			: item.itemNm
				  , vrtyNm 			: item.vrtyNm
				  , spcfctNm 		: item.spcfctNm
				  , gdsSeCd 		: item.gdsSeCd
				  , itemCd 			: item.itemCd
				  , vrtyCd 			: item.vrtyCd
				  , spcfctCd 		: item.spcfctCd
				  , prchsptNm 		: item.prchsptNm
				  , pckgQntt 		: item.pckgQntt
				  , pckgWght 		: item.pckgWght
				  , warehouseSeNm	: item.warehouseSeNm
				  , warehouseSeCd	: item.warehouseSeCd
				  , rmrk			: item.rmrk
				  , pckgSn			: item.pckgSn
				  , gdsGrd			: item.gdsGrd
				  , spmtPckgUnitCd	: item.spmtPckgUnitCd
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
          	SBUxMethod.set("crtr-ymd", pckgYmd);
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	// 페이징
    async function fn_pagingGdsWrhs(){
    	let recordCountPerPage = grdGdsWrhs.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdGdsWrhs.getSelectPageIndex();
    	fn_callSelectGdsWrhsList(recordCountPerPage, currentPageNo);
    }

	// 상품입고 저장 (저장 버튼)
    const fn_save = async function() {
		let apcCd = gv_selectedApcCd;
		let pckgYmd = SBUxMethod.get("srch-dtp-pckgYmd");
		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");
		let prchsptNm = SBUxMethod.get("srch-inp-prchsptNm");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let pckgQntt = SBUxMethod.get("srch-inp-pckgQntt");
		let pckgWght = SBUxMethod.get("srch-inp-pckgWght");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let spmtPckgUnitCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");
		let rmrk = SBUxMethod.get("srch-inp-rmrk");
		let gdsGrd = SBUxMethod.get("stdGrdSlt-slt-knd-1");
 		if (gfn_isEmpty(rmrk)) {
 			rmrk = "";
 		}

		if (gfn_isEmpty(pckgYmd)){
			gfn_comAlert("W0002", "입고일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(gdsSeCd)){
			gfn_comAlert("W0002", "상품구분");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(prchsptNm)){
			gfn_comAlert("W0002", "매입처");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(itemCd)){
			gfn_comAlert("W0002", "품목");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(vrtyCd)){
			gfn_comAlert("W0002", "품종");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(pckgQntt)){
			gfn_comAlert("W0002", "수량");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(pckgWght)){
			gfn_comAlert("W0002", "중량");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(spcfctCd)){
			gfn_comAlert("W0002", "규격");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(spmtPckgUnitCd)){
			gfn_comAlert("W0002", "출하포장단위");	//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(warehouseSeCd)){
			gfn_comAlert("W0002", "창고");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(gdsGrd)){
			gfn_comAlert("W0002", "등급");		//	W0002	{0}을/를 입력하세요.
            return;
		}

    	

    	const gdsWrhs = {
    		apcCd			: gv_selectedApcCd
		  , pckgYmd 		: pckgYmd
		  , gdsSeCd 		: gdsSeCd
		  , itemCd 			: itemCd
		  , vrtyCd 			: vrtyCd
		  , spcfctCd 		: spcfctCd
		  , prchsptNm 		: prchsptNm
		  , pckgQntt 		: pckgQntt
		  , pckgWght 		: pckgWght
		  , warehouseSeCd	: warehouseSeCd
		  , spmtPckgUnitCd	: spmtPckgUnitCd
		  , rmrk			: rmrk
		  , gdsGrd			: gdsGrd
    	}
    	
    	if(!gfn_isEmpty(gdsWrhs.vrtyCd)){
    		gdsWrhs.vrtyCd = gdsWrhs.vrtyCd.substring(4,8);
    	}
    	if (!gfn_comConfirm("Q0001", "저장")) {
    		return;
    	}
    	const postJsonPromise = gfn_postJSON("/am/wrhs/insertGdsInvntr.do", gdsWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

 	// 상품입고 삭제 (삭제 버튼)
    const fn_delete = async function() {
		let apcCd = gv_selectedApcCd;
		let pckgno = SBUxMethod.get("srch-inp-pckgno");
		let pckgSn = SBUxMethod.get("srch-inp-pckgSn");

		if (gfn_isEmpty(pckgno)){
			gfn_comAlert("선택된 데이터가 없습니다.");		//	W0002	{0}을/를 입력하세요.
            return;
		}

    	if (!gfn_comConfirm("Q0001", "삭제")) {
    		return;
    	}

    	const gdsWrhs = {
    		apcCd	: gv_selectedApcCd
		  , pckgno 	: pckgno
		  , pckgSn	: pckgSn
    	}

    	const postJsonPromise = gfn_postJSON("/am/wrhs/deleteGdsInvntr.do", gdsWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	// 초기화
	const fn_reset = function() {
 		// 입고일자
 		SBUxMethod.set("srch-dtp-pckgYmd", gfn_dateToYmd(new Date()));
 		// 품목
 		SBUxMethod.set("srch-slt-itemCd", null);
 		// 품종
 		SBUxMethod.set("srch-slt-vrtyCd", null);
 		// 등급
 		SBUxMethod.set("srch-slt-spmtPckgUnitCd", null);
 		// 등급
 		SBUxMethod.set("stdGrdSlt-slt-knd-1", "01");

 		fn_clearInptForm();

 		fn_onChangeSrchItemCd({value: null});
 	}

	const fn_clearInptForm = function() {
		// 입고번호
		SBUxMethod.set("srch-inp-pckgno", "");
		// 순번
		SBUxMethod.set("srch-inp-pckgSn", "");
 		// 상품구분
 		SBUxMethod.set("srch-rdo-gdsSeCd", "1");
 		// 매입처
 		SBUxMethod.set("srch-inp-prchsptNm", "");
 		// 수량
 		SBUxMethod.set("srch-inp-pckgQntt", "");
 		// 평균중량
 		SBUxMethod.set("srch-inp-wghtAvg", "");
 		// 중량
 		SBUxMethod.set("srch-inp-pckgWght", "");
 		// 규격
 		SBUxMethod.set("srch-slt-spcfctCd", null);
 		// 창고
 		SBUxMethod.set("srch-slt-warehouseSeCd", null);
 		// 창고
 		SBUxMethod.set("srch-slt-spmtPckgUnitCd", null);
 		// 비고
 		SBUxMethod.set("srch-inp-rmrk", "");
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
		let pckgQntt = parseInt(SBUxMethod.get("srch-inp-pckgQntt")) || 0;
		let pckgWght = parseInt(SBUxMethod.get("srch-inp-pckgWght")) || 0;

		if (pckgQntt > 0) {
			let wghtAvg = Math.round(pckgWght/pckgQntt);
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
		const itemInfo = _.find(jsonApcItem, {value: itemCd});
		
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)			// 품종
		]);
		if (gfn_isEmpty(itemCd)) {
			await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, "");
			await gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', jsonSpmtPckgUnitCd, gv_selectedApcCd, "0000", "");		// 포장구분
			await stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_GDS, "");
		} else {
			await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd);					// 규격
			await gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', jsonSpmtPckgUnitCd, gv_selectedApcCd, itemCd);		// 포장구분
			await stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_GDS, itemCd);
		}
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = vrtyCd.substring(0,4);

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if(!gfn_isEmpty(vrtyCd)){
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
			await gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', jsonSpmtPckgUnitCd, gv_selectedApcCd, itemCd, vrtyCd.substring(4,8));
		}
		let vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd.substring(4,8)});
		if(!gfn_isEmpty(vrtyInfo)){
			const wghtRkngSeCd = vrtyInfo.wghtRkngSeCd;
			const unitWght = parseInt(vrtyInfo.unitWght) || 0;
			SBUxMethod.set("srch-inp-wghtAvg", unitWght);
		}
	}

	// 그리드 클릭 이벤트
    const fn_view = async function() {

		let nRow = grdGdsWrhs.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = grdGdsWrhs.getRowData(nRow);
        let itemVrtyCd = rowData.itemCd + rowData.vrtyCd;

		SBUxMethod.set("srch-inp-pckgno", rowData.pckgno);					// 입고번호
		SBUxMethod.set("srch-inp-pckgSn", rowData.pckgSn);					// 순번
		SBUxMethod.set("srch-dtp-pckgYmd", rowData.pckgYmd);				// 입고일자
 		SBUxMethod.set("srch-rdo-gdsSeCd", rowData.gdsSeCd);				// 상품구분
 		if(!gfn_isEmpty(rowData.prchsptNm)){
 			SBUxMethod.set("srch-inp-prchsptNm", rowData.prchsptNm);		// 매입처
 		}else{
 			SBUxMethod.set("srch-inp-prchsptNm", "");						// 매입처
 		}
 		await fn_onChangeSrchVrtyCd({value : itemVrtyCd});				// 품목&품종

 		SBUxMethod.set("srch-inp-pckgQntt", rowData.pckgQntt);				// 수량
 		SBUxMethod.set("srch-inp-pckgWght", rowData.pckgWght);				// 중량
 		fn_onChangeQnttWght();

 		SBUxMethod.set("srch-slt-spcfctCd", rowData.spcfctCd);				// 규격

 		SBUxMethod.set("srch-slt-warehouseSeCd", rowData.warehouseSeCd);	// 창고
 		SBUxMethod.set("srch-slt-spmtPckgUnitCd", rowData.spmtPckgUnitCd);	// 출하포장단위
 		if (gfn_isEmpty(rowData.rmrk)) {
 			SBUxMethod.set("srch-inp-rmrk", "");							// 비고
 		}else{
	 		SBUxMethod.set("srch-inp-rmrk", rowData.rmrk);					// 비고
 		}
 		if (gfn_isEmpty(rowData.gdsGrd)) {
 			SBUxMethod.set("stdGrdSlt-slt-knd-1", "");						// 등급
 		}else{
 			SBUxMethod.set("stdGrdSlt-slt-knd-1", rowData.gdsGrd);			// 등급
 		}
    }
	
	// 거래처 선택 팝업 호출
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-prchsptNm"), fn_setCnpt);
	}

	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set('srch-inp-prchsptNm', cnpt.cnptNm);
		}
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>