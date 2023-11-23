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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 등록결과확인 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<!--
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					-->
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>

					<tbody>
						<tr>
							<th scope="row" class="th_bg" >신청년도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-year"
									name="srch-input-year"
									uitype="single"
									jsondata-ref="jsonDSON"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg" >관할기관</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-cmptnInst"
									name="srch-input-cmptnInst"
									uitype="single"
									jsondata-ref="jsonDSON"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th colspan="2" scope="row" class="th_bg" >시도</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-ctpv"
									name="srch-input-ctpv"
									uitype="single"
									jsondata-ref="jsonDSFA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">법인구분</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-corpSeCd"
									name="srch-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">법인형태</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-select
									id="srch-input-corpDtlSeCd"
									name="srch-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th colspan="2" scope="row" class="th_bg">통합조직여부</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-ii"
									name="srch-input-ii"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">신청대상구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-jj"
									name="srch-input-jj"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">사업자번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-brno"
									name="srch-input-brno"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input">
							</td>
							<th colspan="2" scope="row" class="th_bg">법인명</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">

						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdInvShipOgnReqMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<br>
				<div>
				>출자출하조직 조회
				</div>
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdInvShipOgnReqMng01" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<br>
				<table class="table table-bordered tbl_fixed">
					<caption>출자출하조직 등록 및 신청</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="5" scope="row" class="th_bg th_border_right">법인형태</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">법인등록번호</th>
							<th colspan="4" scope="row" class="th_bg th_border_right">사업자번호</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">업체명</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">법인구분</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">법인형태</th>
							<th colspan="2" scope="row" class="th_bg">법인설립일</th>
						</tr>
						<tr>
							<!-- 법인등록번호 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-crno"
									name="dtl-input-crno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 사업자번호 -->
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 업체명 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 법인구분 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 법인형태 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 법인설립일 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpFndnDay"
									name="dtl-input-corpFndnDay"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="2" rowspan="2" scope="row" class="th_bg th_border_right">출자자수</th>
							<th colspan="1" rowspan="2" scope="row" class="th_bg th_border_right">출자자중<br>농업인 수</th>
							<th colspan="2" rowspan="2" scope="row" class="th_bg th_border_right">출자금액<br>(천원)</th>
							<th colspan="8" scope="row" class="th_bg th_border_right">출자금액(천원)</th>
							<th rowspan="2" scope="row" class="th_bg th_border_left">농업인출<br>자지분율</th>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg th_border_right">농업인</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">생산자단체</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">지자체</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">기타</th>
						</tr>
						<tr>
							<!-- 출자자수 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-invstNope"
									name="dtl-input-invstNope"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 출자자중 농업인 수 -->
							<td colspan="1" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-invstExpndFrmerNope"
									name="dtl-input-invstExpndFrmerNope"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 출자금액 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-invstAmt"
									name="dtl-input-invstAmt"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 농업인 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-frmerInvstAmt"
									name="dtl-input-frmerInvstAmt"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 생산자단체 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-prdcrGrpInvstAmt"
									name="dtl-input-prdcrGrpInvstAmt"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 지자체 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-locgovInvstAmt"
									name="dtl-input-locgovInvstAmt"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 기타 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-etcAmt"
									name="dtl-input-etcAmt"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 농업인출 자지분율 -->
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-12"
									name="dtl-input-12"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="5" scope="row" class="th_bg th_border_right">대표자명</th>
							<th colspan="5" scope="row" class="th_bg th_border_right">전화번호</th>
							<th colspan="5" scope="row" class="th_bg">팩스번호</th>
						</tr>
						<tr>
							<!-- 대표자명 -->
							<td colspan="5" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-rprsvFlnm"
									name="dtl-input-rprsvFlnm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 전화번호 -->
							<td colspan="5" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-rprsvTelno"
									name="dtl-input-rprsvTelno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 팩스번호 -->
							<td colspan="5" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-fxno"
									name="dtl-input-fxno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div>
				>산지유통활성화 지원 자금 신청현황
				기존 보유금액 등을 감안하여 신규(또는 추가)로 필요한 금액 입력.
				</div>

				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>산지유통활성화 지원 자금 신청현황</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="3" scope="row" class="th_bg th_border_right">연도</th>
							<th colspan="4" scope="row" class="th_bg">NH(농협) 자금 신청액</th>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg">2024 자금 신청액</th>
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-12"
									name="dtl-input-12"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="8" style="border: none"></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div>
				*신청대상구분
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>신청대상구분</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="3" scope="row" class="th_bg">신청대상구분</th>
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-12"
									name="dtl-input-12"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="8" style="border: none"></td>
						</tr>
					</tbody>
				</table>
				<div>
				*신청대상구분은 aT본사에서만 이용하는 란입니다.
				</div>
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();

		const elements = document.querySelectorAll(".srch-keyup-area");

		for (let i = 0; i < elements.length; i++) {
		  	const el = elements.item(i);
		  	el.addEventListener("keyup", (event) => {
		  		if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
		  			fn_search();
		  		}
		  		//key	Enter
		  		//keyCode
		  	});
		}
	})


	var jsonInvShipOgnReqMng = []; // 그리드의 참조 데이터 주소 선언
	var grdInvShipOgnReqMng;

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
		fn_fcltMngCreateGrid01();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {



		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdInvShipOgnReqMng';
	    SBGridProperties.id = 'grdInvShipOgnReqMng';
	    SBGridProperties.jsonref = 'jsonInvShipOgnReqMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["신청년도"], 		ref: 'year',   	type:'output',  width:'220px',    style:'text-align:center'},
	    	{caption: ["통합조직여부"], 	ref: 'apoSe',   type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["시도"], 			ref: 'ctpv',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'bb',   	type:'output',  width:'220px',    style:'text-align:center'},
	    ];

	    grdInvShipOgnReqMng = _SBGrid.create(SBGridProperties);
	    /*
	    let rst = await Promise.all([
	    	//fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		*/
		//grdInvShipOgnReqMng.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	   	grdInvShipOgnReqMng.bind('click','fn_view');

	}

	var jsonInvShipOgnReqMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdInvShipOgnReqMng01;

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {

		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdInvShipOgnReqMng01';
	    SBGridProperties.id = 'grdInvShipOgnReqMng01';
	    SBGridProperties.jsonref = 'jsonInvShipOgnReqMng01';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	//{caption: ["순번"], 				ref: 'aa',   	type:'output',  width:'50px',    style:'text-align:center'},
	    	{caption: ["업체명"], 			ref: 'corpNm',   	type:'output',  width:'220px',    style:'text-align:center'},
	    	{caption: ["대표자명"], 			ref: 'rprsvFlnm',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 			ref: 'brno',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["전화번호"], 			ref: 'rprsvTelno',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["법인형태"], 			ref: 'corpDtlSeCd',  	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["출자자수"], 			ref: 'invstNope',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["출자자 중 농업인수"], 	ref: 'invstExpndFrmerNope',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["농업인 출자 지분율"], 	ref: 'ii',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["2020~2022 대출액잔액"],ref: 'jj',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["2023 상환예상액"], 	ref: 'kk',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["2023 자금신청액"], 	ref: 'll',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["2023 가용액"], 		ref: 'mm',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["비고"], 				ref: 'nn',   	type:'output',  width:'120px',    style:'text-align:center'},

	        {caption: ["상세내역"], 	ref: 'crno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpSeCd',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpFndnDay',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'frmerInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'prdcrGrpInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'locgovInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'etcAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'fxno',   	hidden : true}
	    ];

	    grdInvShipOgnReqMng01 = _SBGrid.create(SBGridProperties);
	    /*
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		*/
		//grdInvShipOgnReqMng01.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdInvShipOgnReqMng01.bind('click','fn_view01');

	}


	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let year = SBUxMethod.get("srch-input-year");//
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

    	let postJsonPromise01 = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		cmptnInst : cmptnInst
    		,ctpv : ctpv

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,brno : brno
    		,corpNm : corpNm

		});

        let data = await postJsonPromise01 ;
        try{
        	jsonInvShipOgnReqMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoSe: item.apoSe
						,apoCd: item.apoCd
						,ctpv: item.ctpv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,brno: item.brno
				}
				jsonInvShipOgnReqMng.push(InvShipOgnReqMngVO);
			});

        	grdInvShipOgnReqMng.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	//grdInvShipOgnReqMng.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	/**
     * 저장 버튼
     */
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

    	let apoCd = SBUxMethod.get("dtl-input-apoCd");

    	//필수값 체크
    	//fn_checkRequiredInput();

    	if (gfn_isEmpty(apoCd)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}
    }

    const fn_checkRequiredInput = async function (){
    	//레드닷 처리한 필수값들 확인

    	var val = SBUxMethod.get("dtl-input-trgtYr");

    	if(true){
    		return false;
    	}

    	return true;
    }


    /**
     * @param {boolean} isConfirmed
     * 신규 등록
     */
    const fn_subInsert = async function (isConfirmed){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

   	 	const postJsonPromise = gfn_postJSON("/pd/aom/insertPrdcrCrclOgnReqMng.do", {
   	 		apoCd: SBUxMethod.get('dtl-input-apoCd')//
   	 		,intyYn: SBUxMethod.get('dtl-input-intyYn')//
			,uoNm: SBUxMethod.get('dtl-input-uoNm')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,untyYr: SBUxMethod.get('dtl-input-untyYr')//
		});

        const data = await postJsonPromise;
        console.log("insert result", data);

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {

        }
    }


    /**
     * @param {boolean} isConfirmed
     * 업데이트
     */
	const fn_subUpdate = async function (isConfirmed){
		console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

		const postJsonPromise = gfn_postJSON("/pd/aom/updatePrdcrCrclOgnReqMng.do", {
			apoCd: SBUxMethod.get('dtl-input-apoCd')//
			,intyYn: SBUxMethod.get('dtl-input-intyYn')//
			,uoNm: SBUxMethod.get('dtl-input-uoNm')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,untyYr: SBUxMethod.get('dtl-input-untyYr')//
  		});

		const data = await postJsonPromise;
		console.log("update result", data);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				fn_search();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {

		}

  }



	//통합조직 리스트 그리드 클릭시 출자출하조직 리스트 조회 이벤트
	const fn_view = async function(){
		console.log("******************fn_view**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdInvShipOgnReqMng.getCol();
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdInvShipOgnReqMng.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//해당 로우 데이터로 출자출하조직 리스트 조회
        let rowData = grdInvShipOgnReqMng.getRowData(nRow);
		console.log(rowData);

		let uoBrno = rowData.brno
		let apoCd = rowData.apoCd

		let postJsonPromise = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			uoBrno : uoBrno
    		,apoCd : apoCd

		});
        let data = await postJsonPromise;
        try{
        	jsonInvShipOgnReqMng01.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoCd: item.apoCd
						,corpNm: item.corpNm
						,rprsvFlnm: item.rprsvFlnm
						,brno: item.brno
						,rprsvTelno: item.rprsvTelno
						,corpDtlSeCd: item.corpDtlSeCd
						,invstNope: item.invstNope
						,invstExpndFrmerNope: item.invstExpndFrmerNope

						,crno: item.crno
						,corpSeCd: item.corpSeCd
						,corpFndnDay: item.corpFndnDay
						,invstAmt: item.invstAmt
						,frmerInvstAmt: item.frmerInvstAmt
						,prdcrGrpInvstAmt: item.prdcrGrpInvstAmt
						,locgovInvstAmt: item.locgovInvstAmt
						,etcAmt: item.etcAmt
						,rprsvFlnm: item.rprsvFlnm
						,rprsvTelno: item.rprsvTelno
						,fxno: item.fxno
				}
				jsonInvShipOgnReqMng01.push(InvShipOgnReqMngVO);
			});

        	grdInvShipOgnReqMng01.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	//grdInvShipOgnReqMng01.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

	//출자출하조직 상세 조회
	function fn_view01() {
		console.log("******************fn_view**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdInvShipOgnReqMng01.getCol();
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdInvShipOgnReqMng01.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//해당 로우 데이터로 출자출하조직 리스트 조회
        let rowData = grdInvShipOgnReqMng01.getRowData(nRow);
		console.log(rowData);

		SBUxMethod.set("dtl-input-apoCd", rowData.apoCd);
		SBUxMethod.set("dtl-input-crno", rowData.brno);
		SBUxMethod.set("dtl-input-brno", rowData.brno);
		SBUxMethod.set("dtl-input-corpNm", rowData.corpNm);
		SBUxMethod.set("dtl-input-corpSeCd", rowData.corpSeCd);
		SBUxMethod.set("dtl-input-corpDtlSeCd", rowData.corpDtlSeCd);
		SBUxMethod.set("dtl-input-corpFndnDay", rowData.corpFndnDay);
		SBUxMethod.set("dtl-input-invstNope", rowData.invstNope);
		SBUxMethod.set("dtl-input-invstExpndFrmerNope", rowData.invstExpndFrmerNope);
		SBUxMethod.set("dtl-input-invstAmt", rowData.invstAmt);
		SBUxMethod.set("dtl-input-frmerInvstAmt", rowData.frmerInvstAmt);
		SBUxMethod.set("dtl-input-prdcrGrpInvstAmt", rowData.prdcrGrpInvstAmt);
		SBUxMethod.set("dtl-input-locgovInvstAmt", rowData.locgovInvstAmt);
		SBUxMethod.set("dtl-input-etcAmt", rowData.etcAmt);
		SBUxMethod.set("dtl-input-rprsvFlnm", rowData.rprsvFlnm);
		SBUxMethod.set("dtl-input-rprsvTelno", rowData.rprsvTelno);
		SBUxMethod.set("dtl-input-fxno", rowData.fxno);

    }

	//신규
    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set('dtl-input-intyYn',null)//
    	SBUxMethod.set('dtl-input-uoNm',null)//
    	SBUxMethod.set('dtl-input-uoBrno',null)//
    	SBUxMethod.set('dtl-input-untyYr',null)//
    }

	//삭제
	async function fn_deleteRsrc(InvShipOgnReqMngVO){
		let postJsonPromise = gfn_postJSON("/pd/aom/deleteInvShipOgnReqMng.do", InvShipOgnReqMngVO);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
        		alert("삭제 되었습니다.");
        	}else{
        		alert("삭제 도중 오류가 발생 되었습니다.");
        	}
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

</script>
</html>
