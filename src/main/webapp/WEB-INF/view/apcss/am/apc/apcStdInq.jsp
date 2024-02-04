
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
    <title>title : SBUx2.6</title>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-body">
				<div class="box-header" style="display:flex; justify-content: flex-start; padding-left:5px;" >
					<div>
						<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
						<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물계량등록 -->
	                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
	                    </sbux-label>
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

				<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
					<table class="table table-bordered tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 15%">
							<col style="width: 7%">
							<col style="width: 15%">
							<col style="width: 22%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_bg">APC코드</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input
										uitype="text"
										id="dtl-inp-apcCd"
										name="dtl-inp-apcCd"
										class="form-control input-sm"
										readonly
									></sbux-input>
								</td>
								<th scope="row" class="th_bg">인증키</th>
								<td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-input
										uitype="text"
										id="dtl-inp-certKey"
										name="dtl-inp-certKey"
										class="form-control input-sm"
										readonly
									></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">입고구분</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdWrhsSe" style="height:180px;"></div>

						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">창고</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdWarehousSe" style="height:180px;"></div>


					</div>
					<div class="col-sm-4">

							<div class="ad_tbl_top" style="margin-bottom: 10px;">
								<ul class="ad_tbl_count" style="width: 100%">
									<li>
										<span style="font-size:12px">상품구분</span>
									</li>
								</ul>
							</div>
						<div id="sb-area-grdGdsSe" style="height:180px;"></div>


						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">선별기</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSortFclt" style="height:180px;"></div>
					</div>

					<div class="col-sm-4">

						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">운송구분</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdTrsprtSe" style="height:180px;"></div>

						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">포장기</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdPckgFclt" style="height:180px;"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">품목</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdItem" style="height:258px;"></div>
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">규격</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSpcfct" style="height:258px;"></div>

					</div>
					<div class="col-sm-8">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">품종</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdVrty" style="height:258px;"></div>

						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">등급</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdGrd" style="height:258px;"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">상품</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdGds" style="height:258px;"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">생산자</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdPrdcr" style="height:200px;"></div>
					</div>

					<div class="col-sm-8">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">팔레트/박스</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdPltBx" style="height:200px;"></div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">차량정보</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdVhclInfo" style="height:120px;"></div>
					</div>

					<div class="col-sm-4">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">운송사</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdTrsprtCo" style="height:120px;"></div>
					</div>
					<div class="col-sm-4">
						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">거래처</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdCnpt" style="height:120px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script type="text/javascript">

	function fn_rowStyleCssMdRtlOgnz() {
		//grdMdRtlOgnz.setCellStyle('background-color',0,0,8,2,'#F5FBFF');
		//grdMdRtlOgnz.setRowStyles(9, 'background-color: #CEEBFF; font-weight: bold; color: #0060b3', 'all', true);
	}

	window.addEventListener('DOMContentLoaded', async function(e) {
		
		fn_init();
		
	})

	const fn_init = async function() {
		
		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcCd);
		
		fn_cellCreateApcCrtrInfoGrid();
		
		fn_search();
	}


	const fn_cellCreateApcCrtrInfoGrid = function() {
		// 입고구분
		fn_createWrhsSeGrid();
		// 상품구분
		fn_createGdsSeGrid();
		// 운송구분
		fn_createTrsprtSeGrid();
		// 창고
		fn_createWarehouseGrid();
		// 선별기
		fn_createSortFcltGrid();
		// 포장기
		fn_createPckgFcltGrid();
		// 품목
		fn_createItemGrid();
		// 품종
		fn_createVrtyGrid();
		// 규격
		fn_createSpcfctGrid();
		// 등급
		fn_createGrdGrid();
		// 상품
		fn_createGdsGrid();
		// 생산자
		fn_createPrdcrGrid();
		// 팔레트/박스
		fn_createPltBxGrid();
		// 차량정보
		fn_createVhclInfoGrid();
		// 운송사
		fn_createTrsprtCoGrid();
		// 거래처
		fn_createCnptGrid();
	}

	//그리드 id, 그리드 json
	
	//입고구분
	var grdWrhsSe;
	//상품구분
	var grdGdsSe;
	//운송구분
	var grdTrsprtSe;
	//창고
	var grdWarehouse;
	//선별기
	var grdSortFclt;
	//포장기
	var grdPckgFclt;
	//품목
	var grdItem;
	//품종
	var grdVrty;
	//규격
	var grdSpcfct;
	//등급
	var grdGrd;
	//상품
	var grdGds;
	//생산자
	var grdPrdcr;
	//팔레트/박스
	var grdPltBx;
	//차량정보
	var grdVhclInfo;
	//운송사
	var grdTrsprtCo;
	//거래처
	var grdCnpt;


	//입고구분
	var jsonWrhsSe = [];
	//상품구분
	var jsonGdsSe = [];
	//운송구분
	var jsonTrsprtSe = [];
	//창고
	var jsonWarehouse= [];
	//선별기
	var jsonSortFclt = [];
	//포장기
	var jsonPckgFclt = [];
	//품목
	var jsonItem = [];
	//품종
	var jsonVrty = [];
	//규격
	var jsonSpcfct = [];
	//등급
	var jsonGrd = [];
	//상품
	var jsonGds = [];
	//생산자
	var jsonPrdcr = [];
	//팔레트/박스
	var jsonPltBx = [];
	//차량정보
	var jsonVhclInfo = [];
	//운송사
	var jsonTrsprtCo = [];
	//거래처
	var jsonCnpt = [];
	
	
	const fn_createWrhsSeGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWrhsSe';
	    SBGridProperties.id = 'grdWrhsSe';
	    SBGridProperties.jsonref = 'jsonWrhsSe';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'cdVl', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["코드명"], ref: 'cdVlNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdWrhsSe = _SBGrid.create(SBGridProperties);
	}

	const fn_createGdsSeGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGdsSe';
	    SBGridProperties.id = 'grdGdsSe';
	    SBGridProperties.jsonref = 'jsonGdsSe';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'cdVl', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["코드명"], ref: 'cdVlNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdGdsSe = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createTrsprtSeGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdTrsprtSe';
	    SBGridProperties.id = 'grdTrsprtSe';
	    SBGridProperties.jsonref = 'jsonTrsprtSe';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'cdVl', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["코드명"], ref: 'cdVlNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdTrsprtSe = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createWarehouseGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWarehousSe';
	    SBGridProperties.id = 'grdWarehouse';
	    SBGridProperties.jsonref = 'jsonWarehouse';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'cdVl', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["코드명"], ref: 'cdVlNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["연계코드"], ref: 'linkCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["비고"], ref: 'rmrk', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdWarehouse = _SBGrid.create(SBGridProperties);
	}
	const fn_createSortFcltGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortFclt';
	    SBGridProperties.id = 'grdSortFclt';
	    SBGridProperties.jsonref = 'jsonSortFclt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'cdVl', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["코드명"], ref: 'cdVlNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["연계코드"], ref: 'linkCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["비고"], ref: 'rmrk', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdSortFclt = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createPckgFcltGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgFclt';
	    SBGridProperties.id = 'grdPckgFclt';
	    SBGridProperties.jsonref = 'jsonPckgFclt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'cdVl', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["코드명"], ref: 'cdVlNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["연계코드"], ref: 'linkCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["비고"], ref: 'rmrk', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdPckgFclt = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createItemGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdItem';
	    SBGridProperties.id = 'grdItem';
	    SBGridProperties.jsonref = 'jsonItem';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["품목코드"], ref: 'itemCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["품목명"], ref: 'itemNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	
	    ];
	    grdItem = _SBGrid.create(SBGridProperties);
	}
	const fn_createVrtyGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdVrty';
	    SBGridProperties.id = 'grdVrty';
	    SBGridProperties.jsonref = 'jsonVrty';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["품목코드"], ref: 'itemCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["품목명"], ref: 'itemNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["품종코드"], ref: 'vrtyCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["품종명"], ref: 'vrtyNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	
	    ];
	    grdVrty = _SBGrid.create(SBGridProperties);
	}
	const fn_createSpcfctGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpcfct';
	    SBGridProperties.id = 'grdSpcfct';
	    SBGridProperties.jsonref = 'jsonSpcfct';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["품목코드"], ref: 'itemCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["품목명"], ref: 'itemNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["규격코드"], ref: 'spcfctCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["규격명"], ref: 'spcfctNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	
	    ];
	    grdSpcfct = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createGrdGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGrd';
	    SBGridProperties.id = 'grdGrd';
	    SBGridProperties.jsonref = 'jsonGrd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["품목코드"], ref: 'itemCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["품목명"], ref: 'itemNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["등급구분"], ref: 'grdSeNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["종류코드"], ref: 'grdKnd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["등급종류"], ref: 'grdKndNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["등급코드"], ref: 'grdCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["등급명"], ref: 'grdNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdGrd = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createGdsGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGds';
	    SBGridProperties.id = 'grdGds';
	    SBGridProperties.jsonref = 'jsonGds';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["품목코드"], ref: 'itemCd', type: 'output',  width:'80px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["품목명"], ref: 'itemNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["품종코드"], ref: 'vrtyCd', type: 'output',  width:'80px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["품종명"], ref: 'vrtyNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["규격코드"], ref: 'spcfctCd', type: 'output',  width:'80px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["규격명"], ref: 'spcfctNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["상품코드"], ref: 'spmtPckgUnitCd', type: 'output',  width:'80px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["상품명"], ref: 'spmtPckgUnitNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdGds = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createPrdcrGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcr';
	    SBGridProperties.id = 'grdPrdcr';
	    SBGridProperties.jsonref = 'jsonPrdcr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'prdcrCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["생산자명"], ref: 'prdcrNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["비고"], ref: 'rmrk', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'}
	    ];
	    grdPrdcr = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createPltBxGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPltBx';
	    SBGridProperties.id = 'grdPltBx';
	    SBGridProperties.jsonref = 'jsonPltBx';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["구분"], ref: 'pltBxSeNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["코드"], ref: 'pltBxCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["코드명"], ref: 'pltBxNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'}
	    ];
	    grdPltBx = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createVhclInfoGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdVhclInfo';
	    SBGridProperties.id = 'grdVhclInfo';
	    SBGridProperties.jsonref = 'jsonVhclInfo';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["차량번호"], ref: 'vhclno', type: 'output',  width:'120px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["기사명"], ref: 'drvrNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["비고"], ref: 'rmrk', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'}
	    ];
	    grdVhclInfo = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createTrsprtCoGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdTrsprtCo';
	    SBGridProperties.id = 'grdTrsprtCo';
	    SBGridProperties.jsonref = 'jsonTrsprtCo';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'trsprtCoCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["운송사명"], ref: 'trsprtCoNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdTrsprtCo = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createCnptGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdCnpt';
	    SBGridProperties.id = 'grdCnpt';
	    SBGridProperties.jsonref = 'jsonCnpt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.columns = [
	    	{caption : ["코드"], ref: 'cnptCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
	    	{caption : ["거래처명"], ref: 'cnptNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px;'},
	    ];
	    grdCnpt = _SBGrid.create(SBGridProperties);
	}

	const fn_search = async function () {
		let result = await Promise.all([
				fn_setGrdWrhsSe(),
				fn_setGrdGdsSe(),
				fn_setGrdTrsprtSe(),
				fn_setGrdWarehouse(),
				fn_setGrdSortFclt(),
				fn_setGrdPckgFclt(),
				fn_setGrdItem(),
				fn_setGrdVrty(),
				fn_setGrdSpcfct(),
				fn_setGrdGrd(),
				fn_setGrdGds(),
				fn_setGrdPrdcr(),
				fn_setGrdPltBx(),
				fn_setGrdVhclInfo(),
				fn_setGrdTrsprtCo(),
				fn_setGrdCnpt(),
			]);
	}
	
	// 입고구분
	const fn_setGrdWrhsSe = async function() {
		const param = {
			apcCd: '0000',
			cdId: 'WRHS_SE_CD',
			delYn: 'N'
		}
		jsonWrhsSe.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/co/cd/selectComCdDtlList.do", 
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonWrhsSe.push(item);
	        });
	        
	        grdWrhsSe.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 상품구분
	const fn_setGrdGdsSe = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			cdId: 'GDS_SE_CD',
			delYn: 'N'
		}
		jsonGdsSe.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/co/cd/selectComCdDtlList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonGdsSe.push(item);
	        });
	        
	        grdGdsSe.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 운송구분
	const fn_setGrdTrsprtSe = async function() {
		const param = {
			apcCd: '0000',
			cdId: 'GDS_SE_CD',
			delYn: 'N'
		}
		jsonTrsprtSe.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/co/cd/selectComCdDtlList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonTrsprtSe.push(item);
	        });
	        
	        grdTrsprtSe.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 창고
	const fn_setGrdWarehouse = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			cdId: 'WAREHOUSE_SE_CD',
			delYn: 'N'
		}
		jsonWarehouse.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/co/cd/selectComCdDtlList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonWarehouse.push(item);
	        });
	        
	        grdWarehouse.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 선별기
	const fn_setGrdSortFclt = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			cdId: 'SORT_FCLT_CD',
			delYn: 'N'
		}
		jsonSortFclt.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/co/cd/selectComCdDtlList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonSortFclt.push(item);
	        });
	        
	        grdSortFclt.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 포장기
	const fn_setGrdPckgFclt = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			cdId: 'SORT_FCLT_CD',
			delYn: 'N'
		}
		jsonPckgFclt.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/co/cd/selectComCdDtlList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonPckgFclt.push(item);
	        });
	        
	        grdPckgFclt.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 품목
	const fn_setGrdItem = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonItem.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectApcCmnsItemList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonItem.push(item);
	        });
	        
	        grdItem.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 품종
	const fn_setGrdVrty = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonVrty.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectApcVrtyList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonVrty.push(item);
	        });
	        
	        grdVrty.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 규격
	const fn_setGrdSpcfct = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonSpcfct.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectApcSpcfctList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonSpcfct.push(item);
	        });
	        
	        grdSpcfct.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 등급
	const fn_setGrdGrd = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonGrd.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectStdGrdDtlList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonGrd.push(item);
	        });
	        
	        grdGrd.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 상품
	const fn_setGrdGds = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonGds.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectSpmtPckgUnitList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonGds.push(item);
	        });
	        
	        grdGds.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 생산자
	const fn_setGrdPrdcr = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonPrdcr.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectPrdcrCdList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonPrdcr.push(item);
	        });
	        
	        grdPrdcr.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 팔레트/박스
	const fn_setGrdPltBx = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonPltBx.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectPltBxList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonPltBx.push(item);
	        });
	        
	        grdPltBx.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 차량정보
	const fn_setGrdVhclInfo = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonVhclInfo.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectWrhsVhclCdList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonVhclInfo.push(item);
	        });
	        
	        grdVhclInfo.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 운송사
	const fn_setGrdTrsprtCo = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonTrsprtCo.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/spmt/selectSpmtTrsprtList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonTrsprtCo.push(item);
	        });
	        
	        grdTrsprtCo.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 거래처
	const fn_setGrdCnpt = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonCnpt.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectCnptList.do", 
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonCnpt.push(item);
	        });
	        
	        grdCnpt.rebuild();
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

/**
 *
 const fn_cellGrid = async function() {
	let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

	const postJsonPromise = gfn_postJSON("/fm/fclt/selectMdRtlOgnzNowGridList.do", {crtrYr : crtrYr});

	let data = await postJsonPromise;
	try {

		mdRtlOgnzNowJsonLengthReset();

	  	data.resultMdRtlOgnz.forEach((item, index) => {
	  		const mdRtlOgnz = {
	  				  title : item.title,
	  				  subTitle : item.subTitle,
	  				  s0 : item.s0,
	  				  s1 : item.s1
			}
	  		jsonMdRtlOgnz.push(mdRtlOgnz);
	  	});


	  }	catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}

	  return true;
}
*/

const apcStdInqJsonLengthReset = function() {
	jsonWrhsSe.length = 0;
	jsonGdsSe.length = 0;
	jsonTrsprtSe.length = 0;
}

const apcStdInqGridRebuild = function() {
	grdWrhsSe.rebuild();
	grdGdsSe.rebuild();
	grdTrsprtSe.rebuild();
}

</script>
</html>