<%
/**
 * @Class Name : gdsCd.jsp
 * @Description : 상품코드조회 화면
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
 **/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : 상품코드조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 상품코드조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
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
							<th scope="row" class="th_bg">상품코드</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsCd" name="srch-inp-gdsCd" uitype="text" class="form-control input-sm" mask = "{ 'alias': 'numeric' }"></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" class="form-control input-sm" maxlength="33" show-clear-button="true" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComSpcfct"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-gdsGrd" name="srch-slt-gdsGrd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonGdsGrd"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">브랜드</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-input id="srch-inp-brndCd" name="srch-inp-brndCd" uitype="text" class="form-control input-sm"></sbux-input>
									</div>
								</div>
							</td>
							<td colspan="2">
							<th scope="row" class="th_bg">산지</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-plorCd" name="srch-slt-plorCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spmtPckgUnit" name="srch-slt-spmtPckgUnit" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComSpmtPckgUnit"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품코드내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdGdsCd" style="width:100%;height:508px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
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
	var jsonComItem = 			[];
	var jsonComSpcfct = 		[];
	var jsonGdsGrd = 			[];
	var jsonComSpmtPckgUnit =  	[];

	const fn_initSBSelect = async function() {

		let itemCd = SBUxMethod.get("srch-slt-itemCd");

		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setComCdSBSelect('srch-slt-gdsGrd', 		jsonGdsGrd,		'GDS_GRD'),									// 상품등급
		])
	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		if(gfn_isEmpty(itemCd)){
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, "");
			gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnit', jsonComSpmtPckgUnit, "");
		}else{
			let rst = await Promise.all([
				gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnit', 	jsonComSpmtPckgUnit, 	gv_selectedApcCd, itemCd),	// 포장구분
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 			jsonComSpcfct, 			gv_selectedApcCd, itemCd)	// 규격
			])
		}
	}
	const fn_modalVrty = function() {
		popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}
	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrty.itemCd);
			gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnit', jsonComSpmtPckgUnit, gv_selectedApcCd, vrty.itemCd, vrty.vrtyCd);
		}
	}
	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			var _vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtys.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, '');
				gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnit', jsonComSpmtPckgUnit, "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
				gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnit', jsonComSpmtPckgUnit, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtys.join(','));
		}
	}


	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createGdsCdGrid();
		fn_search();
	})

	var grdGdsCd;
	var jsonGdsCd = [];

	function fn_createGdsCdGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGdsCd';
	    SBGridProperties.id = 'grdGdsCd';
	    SBGridProperties.jsonref = 'jsonGdsCd';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
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
            {caption: ['상품코드'], 		ref: 'gdsCd', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품명'], 		ref: 'gdsNm', 			width: '11%', 	type: 'output', style: 'text-align:center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품등급'], 		ref: 'gdsGrdNm', 		width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['브랜드'], 		ref: 'brndNm', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['산지'], 			ref: 'plorCd', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['포장구분'], 		ref: 'spmtPckgUnitNm', 	width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['입수'], 			ref: 'bxGdsQntt', 		width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['중량'], 			ref: 'wght', 			width: '8%', 	type: 'output', style: 'text-align:center',
            	format : {type:'number', rule:'#,### Kg'}
            }
        ];
        grdGdsCd = _SBGrid.create(SBGridProperties);
        grdGdsCd.bind( "beforepagechanged" , "fn_pagingGrd" );
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
    	grdGdsCd.exportLocalExcel("상품코드", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdGdsCd.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdGdsCd.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdGdsCd.setColHidden(grdGdsCd.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdGdsCd.getFixedCols(); i < grdGdsCd.getCols()-1; i++) {
   			grdGdsCd.setColHidden(i, false);
    	}
   	}

	const fn_pagingGrd = async function(){
    	let pageSize = grdGdsCd.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = grdGdsCd.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdPckgPrfmnc(pageSize, pageNo);
    }

	//조회
    const fn_search = async function() {

    	grdGdsCd.rebuild();
    	let pageSize = grdGdsCd.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonGdsCd.length = 0;
    	grdGdsCd.clearStatus();
    	fn_setGrdPckgPrfmnc(pageSize, pageNo);
    }

	const fn_setGrdPckgPrfmnc = async function(pageSize, pageNo) {
		//검색조건
		let gdsCd = SBUxMethod.get('srch-inp-gdsCd');
		let itemCd = SBUxMethod.get('srch-slt-itemCd');
		let vrtyCd = SBUxMethod.get('srch-inp-vrtyCd');
		let spcfctCd = SBUxMethod.get('srch-slt-spcfctCd');
		let gdsGrd = SBUxMethod.get('srch-slt-gdsGrd');
		let brndCd = SBUxMethod.get('srch-slt-brndCd');
		let plorCd = SBUxMethod.get('srch-slt-plorCd');
		let pckgSeCd = SBUxMethod.get('srch-slt-pckgSeCd');

		const postJsonPromise = gfn_postJSON("/am/pckg/selectGdsCdList.do", {
			apcCd		: gv_selectedApcCd,
			gdsCd		: gdsCd,
			itemCd		: itemCd,
			vrtyCd		: vrtyCd,
			spcfctCd	: spcfctCd,
			gdsGrd		: gdsGrd,
			brndCd		: brndCd,
			plorCd		: plorCd,
			pckgSeCd	: pckgSeCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

            jsonGdsCd.length = 0;
          	data.resultList.forEach((item, index) => {
          		const gdsCd = {
          			gdsCd				: item.gdsCd
          		  ,	gdsNm				: item.gdsNm
          		  ,	itemNm				: item.itemNm
          		  ,	vrtyNm				: item.vrtyNm
          		  ,	spcfctNm			: item.spcfctNm
          		  ,	gdsGrdNm			: item.gdsGrdNm
          		  ,	brndNm				: item.brndNm
          		  ,	plorCd				: item.plorCd
          		  ,	spmtPckgUnitNm		: item.spmtPckgUnitNm
          		  ,	bxGdsQntt			: item.bxGdsQntt
          		  ,	wght				: item.wght
  				}
          		jsonGdsCd.push(gdsCd);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonGdsCd.length > 0) {
          		if(grdGdsCd.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdGdsCd.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdGdsCd.rebuild();
  				}else{
  					grdGdsCd.refresh();
  				}
        	} else {
        		grdGdsCd.setPageTotalCount(totalRecordCount);
        		grdGdsCd.rebuild();
        	}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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