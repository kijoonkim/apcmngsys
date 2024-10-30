<%
 /**
  * @Class Name : dlngDocReg.jsp
  * @Description : 거래명세표 등록
  * @author SI개발부
  * @since 2024.10.28
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.28   	박승진			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 거래명세표 등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	<style>
		.displayFlex > .sbux-pik-wrap {
			display: flex;
			gap: 10px;
		}
	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 거래명세표 등록 -->
					<sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnCmndDocPckg"
						name="btnCmndDocPckg"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_dlngDoc"
						text="거래명세표"
					></sbux-button>
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
						text="초기화"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>
			<div class="box-body" id="progArea">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-wrhsno" name="srch-inp-wrhsno" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-prcsType" name="srch-inp-prcsType" uitype="hidden"></sbux-input>
				<table id="rawMtrWrhsTable" class="table table-bordered tbl_fixed">
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

<%--							<td colspan="9" style="border-right: hidden;">&nbsp;</td>--%>
							<th scope="row" class="th_bg"><span class="data_required" ></span>생산자</th>
							<td colspan="8" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
									autocomplete-height="270px"
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
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
									uitype="hidden"
								/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td colspan="9" class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
							</td>
							<td>
								<sbux-input id="srch-rdo-wrhsSeCd" name="srch-rdo-wrhsSeCd" uitype="hidden"/>
								<sbux-input id="srch-rdo-gdsSeCd" name="srch-rdo-gdsSeCd" uitype="hidden"/>
								<sbux-input id="srch-rdo-trsprtSeCd" name="srch-rdo-trsprtSeCd" uitype="hidden"/>
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="hidden"/>

							</td>

						</tr>

					</tbody>
				</table>

				<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
				</sbux-tabs>

				<div class="tab-content">
					<div id="regTab">
						<!--[pp] //검색 -->
						<!--[pp] 검색결과 -->
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li>

								</li>
							</ul>
							<div class="ad_tbl_toplist">
								<sbux-select
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									uitype="single"
									jsondata-ref="jsonApcSpcfct"
								></sbux-select>
								<sbux-button
									id="btnBndlAplcn"
									name="btnBndlAplcn"
									uitype="normal"
									class="btn btn-sm btn-primary"
									onclick="fn_bndlAplcn"
									text="일괄적용"
								></sbux-button>
							</div>
						</div>
						<div class="table-responsive tbl_scroll_sm">
							<div id="sb-area-grdRawMtrWrhs" style="height:280px;"></div>
						</div>
					</div>
					<div id=listTab>
						<div class="table-responsive tbl_scroll_sm">
							<div id="sb-area-grdRegList" style="height:280px;"></div>
						</div>
					</div>
				</div>

				<!-- 엑셀 시트별 데이터 영역 -->
			</div>
		</div>


	</section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>


	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>

<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		await fn_reset();
	}
	async function cfn_add() {

	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}




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
    var grdRegList;
    /* SBGrid Data (JSON) */
	var jsonRawMtrWrhs = [];
	var jsonRegList = [];

    let vhclData = {vhclno : null, drvrNm : null, bankNm : null, bankCd : null, actno : null, dpstrNm : null};
    var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "등록", "targetid" : "regTab", "targetvalue" : "등록" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "등록내역", "targetid" : "listTab", "targetvalue" : "등록내역" },
	];

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
			 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, '0532'),		// 품종
			 	gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '0532', '1326'),	// 규격
			]);

		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
	}

    /**
     * @name fn_initSBRadio
     * @description SBRadio JSON 불러오기
     */
    const fn_initSBRadio = async function() {

    	let result = await Promise.all([
	    		gfn_getComCdDtls('WRHS_SE_CD'),		// 입고구분
	    		gfn_getComCdDtls('GDS_SE_CD', gv_selectedApcCd),		// 상품구분
	    		gfn_getComCdDtls('TRSPRT_SE_CD'),	// 운송구분
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



		let result = await Promise.all([
				fn_initSBSelect(),
				fn_initSBRadio(),
				fn_getPrdcrs()
			]);
		fn_createGrid();
		fn_createGrid2();
	}


	// only document
	window.addEventListener('DOMContentLoaded', async function(e) {
		let result = await Promise.all([
			fn_init()
		]);
	});



	/**
	 * @name fn_createGrid
	 * @description 거래명세표 그리드 생성
	 */
	const fn_createGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhs';
	    SBGridProperties.id = 'grdRawMtrWrhs';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'none';
		SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.total = {
	    		  type 		: 'grand',
	    		  position	: 'bottom',
	    		  columns		: {
	    		      standard : [2],
	    		      sum : [3,4,5],
	    		  },
	    		  grandtotalrow : {
	    		      titlecol 	: 2,
	    		      titlevalue	: '합계'
	    		  }
	    }
	    SBGridProperties.columns = [

	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',   width : '17%',    style:'text-align:center'},
	        {caption: ["규격"],		ref: 'spcfctCd',    type:'combo',  typeinfo : {ref:'jsonApcSpcfct', label:'label', value:'value', oneclickedit: true},  width:'17%',    style:'text-align:center', sortable: false},
	        {caption: ["수량"],		ref: 'bxQntt',      type:'input',  width:'17%',    style:'text-align:center', sortable: false,
	        	dataType : 'number' ,format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["단가"],	ref: 'untPrc',    type:'input',  width:'17%',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["공급가"],	ref: 'splyPrc',    type:'input',  width:'17%',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        }
	        ];

	    grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
	    grdRawMtrWrhs.bind('valuechanged','fn_grdValueChanged');

	    var jsonRawMtrWrhsTemp = [];
	    jsonApcVrty.forEach(item => {
	    	var data = {
	    			vrtyNm : item.vrtyNm
	    			, vrtyCd : item.vrtyCd
	    			, itemCd : item.itemCd
	    			, itemNm : item.itemNm
	    			, itemVrtyCd : item.itemVrtyCd
	    	}
	    	jsonRawMtrWrhsTemp.push(data);
	    })

	    jsonRawMtrWrhs = jsonRawMtrWrhsTemp;
	    grdRawMtrWrhs.rebuild();

	}

	/**
	 * @name fn_createGrid2
	 * @description 등록내역 그리드 생성
	 */
	const fn_createGrid2 = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRegList';
	    SBGridProperties.id = 'grdRegList';
	    SBGridProperties.jsonref = 'jsonRegList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'none';
		SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.columns = [

	        {caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',   width : '10%',    style:'text-align:center'},
	        //{caption: ["순번"],		ref: 'rowSeq',    type:'output'  ,  width:'17%',    style:'text-align:center', sortable: false},
	        {caption: ["생산자"],		ref: 'prdcrNm',      type:'output',  width:'17%',    style:'text-align:center', sortable: false},
	        //{caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'17%',    style:'text-align:center', sortable: false},
	        {caption: ["수량"],	ref: 'wrhsQntt',    type:'input',  width:'17%',    style:'text-align:center', sortable: false,
	        	dataType : 'number' ,format : {type:'number', rule:'#,###'}
	        },

	        {caption: ["처리"], 		ref: 'search', 		type:'button', width:'5%', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                   return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_searchRow(grdRegList," + nRow + ", " + nCol + ")'>조회</button>";
                }},
            {caption: ["처리"], 		ref: 'delete', 		type:'button', width:'5%', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                   if (objRowData.inqYn === "N"){
                	   return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_deleteRow(grdRegList," + nRow + ", " + nCol + ")'>삭제</button>";
                   }else{
                	   return "<button type='button' class='btn btn-xs btn-outline-danger' disabled>삭제</button>";
                   }

                }},
	        ];

	    grdRegList = _SBGrid.create(SBGridProperties);
	    //grdRegList.bind('valuechanged','fn_grdValueChanged');



	}

	const fn_bndlAplcn = function(){
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let spcfctText = SBUxMethod.getText("srch-slt-spcfctCd");
		jsonRawMtrWrhs.forEach(item => {
			item['spcfctCd'] = spcfctCd;
		})
		grdRawMtrWrhs.refresh();

	}

	const fn_grdValueChanged = function(){


		let allData = grdRawMtrWrhs.getGridDataAll();
		let row = grdRawMtrWrhs.getTotalRowIndex();
		let col = grdRawMtrWrhs.getCol();

		let col1 = grdRawMtrWrhs.getColRef("vrtyNm");
		let col2 = grdRawMtrWrhs.getColRef("spcfctNm");


		if (col === col1 || col === col2){
			return;
		}
		grdRawMtrWrhs.clearTotal();

		let totalVal = {
  		  type 		: 'grand',
  		  position	: 'bottom',
  		  columns		: {
  		      standard : [2],
  		      sum : [3,4,5],
  		  },
  		  grandtotalrow : {
  		      titlecol 	: 2,
  		      titlevalue	: '합계'
  		  }
  		}
		grdRawMtrWrhs.setTotal(totalVal);



		/* let bxQntt = 0;
		let unitPrc = 0;
		let splyUntprc = 0;
		allData.forEach(item => {
			bxQntt += parseAndCheck(item.bxQntt);
			unitPrc += parseAndCheck(item.unitPrc);
			splyUntprc += parseAndCheck(item.splyUntprc);
		})
		let objRowData = {
			bxQntt : bxQntt
			, unitPrc : unitPrc
			, splyUntprc : splyUntprc
		}
		grdRawMtrWrhs.setRowData(row, objRowData, true); */
	}

	function parseAndCheck(value) {
		  const parsed = parseInt(value, 10);
		  return isNaN(parsed) ? 0 : parsed;
	}




	/**
	 * common button action
	 */

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
     const fn_reset = async function() {
    	 grdRawMtrWrhs.destroy();
    	 fn_createGrid();
	}

     const fn_search = async function() {
 		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고시작일자

   		// optional
   		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자

   		if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

  	    try{
  	    	let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";
  			const postJsonPromise = gfn_postJSON(postUrl, {
 	 				apcCd: gv_selectedApcCd,
 	 				wrhsYmdFrom: wrhsYmdFrom,
 	 				wrhsYmdTo: wrhsYmdFrom,
 	 				//wrhsSeCd: wrhsSeCd,
 	 				//gdsSeCd: gdsSeCd,
 	 				//trsprtSeCd: trsprtSeCd,
 	 				//warehouseSeCd: warehouseSeCd,
 	 				prdcrCd: prdcrCd,
 	 				vrtyCd: '',
 	 				itemCd: '1326',
 	 				//vhclno: vhclno,
 	 				//invntrYn: invntrYn
 	 	          	// pagination
 	 	  	  		//pagingYn : 'Y',
 	 	  			//currentPageNo : pageNo,
 	 	   		  	//recordCountPerPage : pageSize
 	 	  		});

  	        const data = await postJsonPromise;


  	    	if (!_.isEqual("S", data.resultStatus)) {
 	        	gfn_comAlert(data.resultCode, data.resultMessage);
 	        	return;
 	        }

 			/** @type {number} **/
       		let totalRecordCount = 0;

       		jsonRegList.length = 0;
       		var jsonRegListTemp = [];




       		const result = Object.values(
       				data.resultList.reduce((acc, item) => {
       			    const { pltno, bxQntt, wrhsWght,apcCd,apcNm,wrhsYmd,prdcrCd,prdcrNm,wrhsno,wghno,itemCd,itemNm,vrtyCd,vrtyNm,inqYn,wrhsQntt,invntrQntt,invntrWght } = item;

       			    // acc에 pltno가 없으면 새로운 항목 추가, 있으면 bxQntt와 wrhsWght를 합산
       			    if (!acc[pltno]) {
       			      acc[pltno] = { pltno, bxQntt: 0, wrhsWght: 0, apcCd,apcNm,wrhsYmd,prdcrCd,prdcrNm,wrhsno,wghno,itemCd,itemNm,vrtyCd,vrtyNm,inqYn,wrhsQntt,invntrQntt,invntrWght };
       			    }

       			    acc[pltno].wrhsQntt += bxQntt;
       			    acc[pltno].wrhsWght += wrhsWght;

       			    return acc;
       			  }, {})
       			);

           	/* data.resultList.forEach((item, index) => {
           		const rawMtrWrhs = {
   						rowSeq: item.rowSeq,
   						apcCd: item.apcCd,
   						apcNm: item.apcNm,
   						wrhsYmd: item.wrhsYmd,
   						prdcrCd: item.prdcrCd,
   						prdcrNm: item.prdcrNm,
   						wrhsno: item.wrhsno,
   						wghno: item.wghno,
   						pltno: item.pltno,
   						itemCd: item.itemCd,
   						itemNm: item.itemNm,
   						vrtyCd: item.vrtyCd,
   						vrtyNm: item.vrtyNm,
   						inqYn : item.inqYn,
   						bxQntt: item.bxQntt,
   						wrhsWght: item.wrhsWght,
   						wrhsQntt: item.bxQntt,
   						invntrQntt: item.invntrQntt,
   						invntrWght: item.invntrWght,
   				}
           		jsonRegList.push(rawMtrWrhs);

   			});*/
   			jsonRegList = result;
           	if (jsonRawMtrWrhs.length > 0) {
           		grdRegList.refresh();
           		grdRegList.setRow(1);
           	} else {
           		grdRegList.rebuild();
          	}

         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
      	}
 	}




    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

		let prcsType = SBUxMethod.get("srch-inp-prcsType");
		let allData = grdRawMtrWrhs.getGridDataAll();

    	// 항목 set
    	let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고일자
 		let wrhsSeCd = SBUxMethod.get("srch-rdo-wrhsSeCd");		// 입고구분
 		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");		// 상품구분
 		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");	// 운송구분
 		//let itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
 		//let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");			// 품종
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");		// 생산자
 		//let bxQntt = SBUxMethod.get("srch-inp-bxQntt");			// 수량
 		//let wrhsWght = SBUxMethod.get("srch-inp-wrhsWght");		// 중량
 		//let pltno = SBUxMethod.get("srch-inp-pltno");			// 팔레트번호 -> 값 없으면 알아서 할당해줌
 		let bxKnd = SBUxMethod.get("srch-slt-bxKnd");			// 박스종류
 		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
 		let vhclno = gfn_nvl(SBUxMethod.get("srch-inp-vhclno"));			// 차량번호
 		//let trsprtCst = SBUxMethod.get("srch-inp-trsprtCst");	// 운임비용
 		let rmrk = gfn_nvl(SBUxMethod.get("srch-inp-rmrk"));				// 비고
 		let wghno = gfn_nvl(SBUxMethod.get("srch-inp-wghno"));			// 계량번호
 		let prdctnYr = SBUxMethod.get("srch-dtp-prdctnYr");		// 생산연도

		allData.pop();
 		allData.forEach(item => {

 			//let tempSpcfct = jsonApcSpcfct.find(data => data.spcfctCd === item.['spcfctCd'])
 			let spc = jsonApcSpcfct.find(data => data.spcfctCd === item['spcfctCd'])['spcfctNm'].replace(/[^0-9]/g, '');
			item['apcCd'] = gv_apcCd
 			item['prdcrCd'] = prdcrCd;
 			item['wrhsYmd'] = wrhsYmd;
 			item['itemCd'] = '1326';
 			item['prdcrCd'] = prdcrCd;
 			item['wrhsQntt'] = item['bxQntt'];
 			item['wrhsWght'] = parseInt(item['bxQntt']) * parseInt(spc);
 			item['vhclno'] = vhclno;
 			item['prdctnYr'] = wrhsYmd.substring(0,4)
 			item["wghno"] = "";
 			item["wrhsSeCd"] = wrhsSeCd;
 			item["trsprtSeCd"] = trsprtSeCd;
 			item["inqYn"] = "N";
 			//item["gdsSeCd"] = gdsSeCd; 이상한값이 들어와서 일단 뺌

 		})


    	// validation check
    	if (gfn_isEmpty(wrhsYmd)) {
    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	if (!gfn_comConfirm("Q0001", "저장")) {
    		return;
    	}



    	//let postUrl = gfn_isEmpty(wrhsno) ? "/am/wrhs/insertRawMtrWrhs.do" : "/am/wrhs/updateRawMtrWrhs.do";
    	let postUrl = "/am/wrhs/insertRawMtrWrhsListJiwoo.do";
    	const filteredList = allData.filter(item => item.wrhsQntt !== "" || item.wrhsQntt === "undefined");

     	const postJsonPromise = gfn_postJSON(postUrl, filteredList);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

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
			fn_initSBRadio(),
			fn_getPrdcrs()
		]);
	}

	const fn_setStdGdsSelect = async function(_itemCd, _stdGrdObj, _isWght) {
		await stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, _itemCd, _stdGrdObj, _isWght);
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

			SBUxMethod.set("srch-inp-wghtAvg", "");

				SBUxMethod.set("srch-slt-itemCd", itemCd);
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}

		let vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd.substring(4,8)});
		if(!gfn_isEmpty(vrtyInfo)){
			const wghtRkngSeCd = vrtyInfo.wghtRkngSeCd;
			const unitWght = parseInt(vrtyInfo.unitWght) || 0;
			SBUxMethod.set("srch-inp-wghtAvg", unitWght);
		}
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
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {

		await fn_getPrdcrs();

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
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsItemCd + prdcr.rprsVrtyCd);
			fn_onChangeSrchVrtyCd({value : prdcr.rprsItemCd + prdcr.rprsVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
				}
			}
		}

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

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}

	}



	const fn_setTrsprtCst = function(trsprtCst) {
		if (!gfn_isEmpty(trsprtCst)) {
			SBUxMethod.set("srch-inp-trsprtCst", trsprtCst.trsprtCst);
		}
	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}


	/**
     * @name fn_dlngDoc
     * @description 거래명세표 발행 버튼
     */
	const fn_dlngDoc = async function(pltno) {
		//let wrhsno = SBUxMethod.get("srch-inp-wrhsno");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
		let wrhsYmd= SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고시작일자

		if (gfn_isEmpty(prdcrCd)) {
			gfn_comAlert("W0001", "생산자");		//	W0001	{0}을/를 선택하세요.
            return;
		}


		if(pltno === undefined){
			let rowData = grdRegList.getRowData(grdRegList.getRow());
			pltno = rowData.pltno;
		}



/* 		let wrhsNoList = [];
		jsonRegList.forEach(item => {
			if(item.wrhsno !== ""){
				wrhsNoList.push(item.wrhsno);
			}
		});

		if(wrhsNoList.length == 0){
			return;
		}

		wrhsNoList = wrhsNoList.join("','"); */
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'RT_DOC');
		//let obj = {apcCd: gv_selectedApcCd, prdcrCd: prdcrCd, wrhsYmd : wrhsYmd, wrhsno: gfn_nvl(wrhsNoList)};
		let obj = {apcCd: gv_selectedApcCd, prdcrCd: prdcrCd, wrhsYmd : wrhsYmd, pltno : pltno};
		/* if(wrhsno !== undefined){
			obj['wrhsno'] = wrhsno;
		} */

		gfn_popClipReport("거래명세표", rptUrl, obj );

		fn_inqUpdate(obj.pltno);

	}

	const fn_searchRow = async function(grd,nRow,nCol){
		let rowData = grd.getRowData(nRow);
		fn_dlngDoc(rowData.pltno);
	}

	const fn_deleteRow = async function(grd,nRow,nCol){
		let rowData = grd.getRowData(nRow);
		fn_delete(rowData.pltno)
	}


    /**
     * @name fn_inqUpdate
     * @description 조회버튼 클릭 시 삭제 못하게 함(INQ_YN = "Y")
     */
    const fn_inqUpdate = async function(pltno) {


		let obj = {
				apcCd : gv_apcCd
				, pltno : pltno
				, inqYn : "Y"
		}




    	//let postUrl = gfn_isEmpty(wrhsno) ? "/am/wrhs/insertRawMtrWrhs.do" : "/am/wrhs/updateRawMtrWrhs.do";
    	let postUrl = "/am/wrhs/updateRawMtrWrhsInq.do";

     	const postJsonPromise = gfn_postJSON(postUrl, obj);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

	}

    const fn_delete = async function(pltno){
    	let obj = {
				apcCd : gv_apcCd
				, pltno : pltno
		}




    	//let postUrl = gfn_isEmpty(wrhsno) ? "/am/wrhs/insertRawMtrWrhs.do" : "/am/wrhs/updateRawMtrWrhs.do";
    	let postUrl = "/am/wrhs/deleteRawMtrWrhsListJiwoo.do";

     	const postJsonPromise = gfn_postJSON(postUrl, obj);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }






</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>