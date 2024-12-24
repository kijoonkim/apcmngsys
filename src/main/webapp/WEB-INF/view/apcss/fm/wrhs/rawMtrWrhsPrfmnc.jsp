<%
 /**
  * @Class Name : rawMtrWrhsPrfmnc.jsp
  * @Description : 원물입고실적조회 화면
  * @author SI개발부
  * @since 2024.10.02
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.02   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 입고실적조회</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 입고실적조회 -->
				</div>
				<div style="margin-left: auto;">
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
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<th scope="row" class="th_bg">생산농가</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-prdcrCd"
									name="srch-slt-prdcrCd"
									class="form-control input-sm"
									jsondata-ref="jsonPrdcr"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">입고일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdFrom"
									name="srch-dtp-wrhsYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdTo"
									name="srch-dtp-wrhsYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td colspan="" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>원물입고 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-wrhs">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRawMtrWrhs" style="height:508px;"></div>
				</div>
			</div>
		</div>
		<!-- clip report direct print area  -->
		<div id="div-rpt-clipReportPrint" style="display:none;"></div>
	</section>

    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
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

}
async function cfn_search() {
	await fn_search();
}
	// 원물입고실적 조회 날짜 제한
	const lv_ymd_limit = 90;
	var jsonComItem				= [];	// 품목 		itemCd			검색
	var jsonComVrty				= [];
	var jsonPrdcr				= [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),										// 품목
	 	]);

		var prdcrResultList = JSON.parse('${prdcrResultList}');

		console.log("prdcrResultList", prdcrResultList)

		prdcrResultList.forEach((item, index) => {
			const prdcr = {
					value 	: item.PRDCR_CD
				  , text	: item.PRDCR_NM
			}
			jsonPrdcr.push(prdcr);
		})
		SBUxMethod.refresh("srch-slt-prdcrCd");

		if (jsonPrdcr.length == 1) {
			SBUxMethod.set("srch-slt-prdcrCd", jsonPrdcr[0].value);
			SBUxMethod.attr("srch-slt-prdcrCd", "disabled", true);
		} else {
			SBUxMethod.attr("srch-slt-prdcrCd", "disabled", false);
		}
	}

    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	var vrtyCds = [];

    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			vrtyCds = [];
			vrtyCds.push(vrty.vrtyCd);
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}

    const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtys.push(vrtys[i].vrtyNm);
				vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}

    function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		if (gfn_isEmpty(itemCd)) {
			vrtyCds = [];
		}
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("srch-inp-vhclno"));
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);
		}
	}

	const fn_init = function() {
		fn_createGrid();
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_dtpChange = function(){
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		var maxYmd = gfn_addDate(wrhsYmdFrom,lv_ymd_limit);

		SBUxMethod.setDatepickerMaxDate('srch-dtp-wrhsYmdTo', maxYmd);

		if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			var dt = gfn_addDate(wrhsYmdFrom,30)
			SBUxMethod.set("srch-dtp-wrhsYmdFrom", wrhsYmdFrom);
			SBUxMethod.set("srch-dtp-wrhsYmdTo", dt);
			return;
		}

		if (maxYmd < wrhsYmdTo) {
    		SBUxMethod.set("srch-dtp-wrhsYmdTo", maxYmd);
	    }
	}

	var grdRawMtrWrhs;	// 원물입고실적 그리드
	var jsonRawMtrWrhs = [];

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhs';
	    SBGridProperties.id = 'grdRawMtrWrhs';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'none';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	    	{caption: ["APC명"],		ref: 'apcNm',      	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'prdcrNm',     type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["입고일자"],		ref: 'wrhsYmd',     type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["품목"],			ref: 'itemNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종"],			ref: 'vrtyNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["등급"],			ref: 'grdNm',      	type:'output',  width:'80px',    style:'text-align:center'},
	        {
	        	caption: ["입고수량"],
	        	ref: 'wrhsQntt',
	        	type:'output',
	        	width:'100px',
	        	style:'text-align:right',
	        	typeinfo : {mask : {alias : 'numeric'}},
	        	format : {
	        		type:'number',
	        		rule:'#,###  '
	        	}
	        },
	        {
	        	caption: ["입고중량 (Kg)"],
	        	ref: 'wrhsWght',
	        	type:'output',
	        	width:'100px',
	        	style:'text-align:right',
	        	typeinfo : {mask : {alias : 'numeric'}},
	        	format : {
	        		type:'number',
	        		rule:'#,###  '
	        	}
	        },
	        {caption: ["비고"],			ref: 'rmrk',      	type:'output',  width:'300px',    style:'text-align:center'},
	        {caption: ["입고번호"],		ref: 'wrhsno',		type:'output',  hidden: true},
	    ];
	    grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
	    grdRawMtrWrhs.bind("afterpagechanged" , fn_pagingGrdRawMtrWrhs);
		grdRawMtrWrhs.bind("dblclick" , cfn_reqTab);
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
    	grdRawMtrWrhs.exportLocalExcel(
    						"입고실적", {
    							bSaveLabelData: true,
    							bNullToBlank: true,
    							bSaveSubtotalValue: true,
    							bCaptionConvertBr: true,
    							arrSaveConvertText: true
    						});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdRawMtrWrhs.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdRawMtrWrhs.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdRawMtrWrhs.setColHidden(grdRawMtrWrhs.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdRawMtrWrhs.getFixedCols(); i < grdRawMtrWrhs.getCols()-1; i++) {
    		grdRawMtrWrhs.setColHidden(i, false);
    	}
   	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

	const fn_onChangeApc = async function() {
		fn_initSBSelect();
	}


	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		if (	gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdFrom"))
				|| gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdTo"))){
			gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
		    return;
		}

		// set pagination
    	grdRawMtrWrhs.rebuild();
    	let pageSize = grdRawMtrWrhs.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonRawMtrWrhs.length = 0;
    	await fn_setGrdRawMtrWrhsPrfmnc(pageSize, pageNo);
	}


	const fn_setGrdRawMtrWrhsPrfmnc = async function(pageSize, pageNo) {
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");		// 입고시작일자
   		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");		// 입고종료일자

  		// optional
  		let prdcrCd = SBUxMethod.get("srch-slt-prdcrCd");	// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = vrtyCds.length > 0 ? vrtyCds.join(',') : "";

 	    try{
 	    	let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";
 			const postJsonPromise = gfn_postJSON(postUrl, {
	 				apcCd: gv_selectedApcCd,
	 				wrhsYmdFrom: wrhsYmdFrom,
	 				wrhsYmdTo: wrhsYmdTo,
	 				prdcrCd: prdcrCd,
	 				vrtyCd: vrtyCd,
	 				itemCd: itemCd,
	 	  		});

 	        const data = await postJsonPromise;


 	    	if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

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
  						wrhsQntt: item.bxQntt,
  						bxKnd: item.bxKnd,
  						bxKndNm: item.bxKndNm,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						rmrk: item.rmrk,
  						trsprtCst: item.trsprtCst,
  						prcsType: item.prcsType,
  						prcsTypeNm: item.prcsTypeNm,
  						invntrQntt: item.invntrQntt,
  						invntrWght: item.invntrWght,
  				}
          		jsonRawMtrWrhs.push(rawMtrWrhs);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  					document.querySelector('#cnt-wrhs').innerText = totalRecordCount;
  				}
  			});

          	//grdRawMtrWrhs.rebuild();
			document.querySelector('#cnt-wrhs').innerText = jsonRawMtrWrhs.length;
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

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
     	}
	}

	// 페이징
    async function fn_pagingGrdRawMtrWrhs(){
    	let recordCountPerPage = grdRawMtrWrhs.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdRawMtrWrhs.getSelectPageIndex();
    	fn_setGrdRawMtrWrhsPrfmnc(recordCountPerPage, currentPageNo);
    }

	function fn_getChkbox(json, result) {
		val = [];
		if(json.length == 1){
			val.push(json[0].value);
		}else{
			for(var key in result){
				if(result[key] == true)
					val.push(json[Number(key.substring(key.lastIndexOf('_')+1))].value);
			}
		}

		return val.join(',');
	}

	$(function(){
		$(".glyphicon").on("click", function(){
			SBUxMethod.set("srch-inp-vrtyCd", "");
			vrtyCds.length = 0;
		})
	})

	/** main 레이아웃을 통해서 전달하고자 하는 탭에 선택한 row 정보를 전달함. **/
	let cfn_reqTab = function(){
		let idx = grdRawMtrWrhs.getRow();
		let data = grdRawMtrWrhs.getRowData(idx);
		/** 전달하고자하는 TAB의 아이디를 객체 필드에 담아서 전달 **/
		data.target = 'AM_001_002'
		let json = JSON.stringify(data);
		/** main에 선언되어있는 fn **/
		window.parent.cfn_openTabSearch(json);
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>