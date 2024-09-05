<%
 /**
  * @Class Name : fcltOperHfInfoReg.jsp
  * @Description : 3.6.고용인력 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.12.12   	김현호		최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 시설고용인력 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
				<sbux-button id="btnTmprStrg" name="btnTmprStrg" uitype="normal" text="임시저장" class="btn btn-sm btn-outline-danger" onclick="fn_tmprStrg"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
					<col style="width: 11%">
					<col style="width: 22%">
					<col style="width: 50px">
					<col style="width: 11%">
					<col style="width: 22%">
					<col style="width: 187px">
					<col style="width: 100px">
				<tbody>
					<tr>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<!--
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectGrdHireInfoList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							-->
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>

			<br>
			<!-- 진척도 추가 -->
			<%@ include file="prgrs/apcPrgrs.jsp" %>
			<br>
			<div><label>내국인 상세내역</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>내국인 상세</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 30px">
						<col style="width: 15%">
						<col style="width: 30px">
						<col style="width: 20%">
						<col style="width: 50px">
						<col style="width: 20%">
						<col style="width: 50px">
						<col style="width: 15%">
						<col style="width: 30px">
						<col style="width: 15%">
						<col style="width: 30px">
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="4" >정규직</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="8" >일용직</th>
						</tr>
						<tr>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">사무실</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">현장</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">연간 임금총계</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">평균임금(1인/1일)</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">비수기 일일 인원수<br>(MIN)</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">성수기 일일 인원수<br>(MAX)</th>
						</tr>
						<tr>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireRgllbrOfc"
									name="dtl-inp-hireRgllbrOfc"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>명</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireRgllbrSpt"
									name="dtl-inp-hireRgllbrSpt"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>명</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireTmprWgTotSum"
									name="dtl-inp-hireTmprWgTotSum"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>(천원)</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireTmprAvgWg"
									name="dtl-inp-hireTmprAvgWg"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>(천원)</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireTmprMin"
									name="dtl-inp-hireTmprMin"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>명</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireTmprMax"
									name="dtl-inp-hireTmprMax"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>명</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div><label>외국인 상세내역</label></div>
			<!-- 외국인 근로자 -->
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>외국인 상세</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 30px">
						<col style="width: 15%">
						<col style="width: 30px">
						<col style="width: 15%">
						<col style="width: 30px">
						<col style="width: 55%">
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">비수기</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">성수기</th>
							<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">평균</th>
							<th class="text-center" style="border-right: 1px solid white !important;">주요업무내용</th>
						</tr>
						<tr>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireFrgnrMin"
									name="dtl-inp-hireFrgnrMin"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>명</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireFrgnrMax"
									name="dtl-inp-hireFrgnrMax"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>명</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireFrgnrAvg"
									name="dtl-inp-hireFrgnrAvg"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
							<td>명</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-hireFrgnrTaskCn"
									name="dtl-inp-hireFrgnrTaskCn"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									style="text-align: right"
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let apcCd = '0861';
		let crtrYr = '2024';
		let apcNm = 'test';
		SBUxMethod.set("srch-inp-apcCd", apcCd);
		SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();
	});

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_clearForm();
		await fn_search();
		//진척도
		await cfn_selectPrgrs();

		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		if(prgrsLast  == 'Y'){
			await SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
		} else {
			await SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
		}
	}

	//입력폼 초기화
	function fn_clearForm() {
		SBUxMethod.set('dtl-inp-hireRgllbrCtzn',null);
		SBUxMethod.set('dtl-inp-hireRgllbrFrgnr',null);

		SBUxMethod.set('dtl-inp-hireTmprWgTotSum',null);
		SBUxMethod.set('dtl-inp-hireTmprAvgWg',null);

		SBUxMethod.set('dtl-inp-hireTmprMin',null);
		SBUxMethod.set('dtl-inp-hireTmprMax',null);

		SBUxMethod.set('dtl-inp-hireFrgnrMin',null);
		SBUxMethod.set('dtl-inp-hireFrgnrMax',null);
		SBUxMethod.set('dtl-inp-hireFrgnrAvg',null);
		SBUxMethod.set('dtl-inp-hireFrgnrTaskCn',null);
	}

	const fn_search = async function() {
		await fn_clearForm();
		//진척도 갱신
		await cfn_selectPrgrs();

		await fn_selectGrdHireInfoList();
	}

	const fn_selectGrdHireInfoList = async function(copy_chk) {
		 console.log("******************fn_setGrdHireInfoList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperHfInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr,

			// pagination
			//pagingYn : 'N',
			//currentPageNo : pageNo,
			//recordCountPerPage : pageSize
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {

			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-inp-hireRgllbrSpt',gfn_nvl(item.hireRgllbrSpt));
				SBUxMethod.set('dtl-inp-hireRgllbrOfc',gfn_nvl(item.hireRgllbrOfc));

				SBUxMethod.set('dtl-inp-hireTmprWgTotSum',gfn_nvl(item.hireTmprWgTotSum));
				SBUxMethod.set('dtl-inp-hireTmprAvgWg',gfn_nvl(item.hireTmprAvgWg));

				SBUxMethod.set('dtl-inp-hireTmprMin',gfn_nvl(item.hireTmprMin));
				SBUxMethod.set('dtl-inp-hireTmprMax',gfn_nvl(item.hireTmprMax));

				SBUxMethod.set('dtl-inp-hireFrgnrMin',gfn_nvl(item.hireFrgnrMin));
				SBUxMethod.set('dtl-inp-hireFrgnrMax',gfn_nvl(item.hireFrgnrMax));
				SBUxMethod.set('dtl-inp-hireFrgnrAvg',gfn_nvl(item.hireFrgnrAvg));
				SBUxMethod.set('dtl-inp-hireFrgnrTaskCn',gfn_nvl(item.hireFrgnrTaskCn));
			});

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//등록
	const fn_save = async function() {
		console.log("******************fn_save**********************************");
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}
		if (gfn_isEmpty(crtrYr)) {
			alert("대상연도를 작성해주세요");
			return;
		}

		fn_subInsert(confirm("등록 하시겠습니까?") , "N");
	}

	//임시저장
	const fn_tmprStrg = async function(tmpChk) {
		fn_subInsert(confirm("임시저장 하시겠습니까?") , 'Y');
	}

	//신규등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperHfInfo.do", {
			crtrYr : SBUxMethod.get('srch-inp-crtrYr')
			,apcCd : SBUxMethod.get('srch-inp-apcCd')
			, prgrsYn : 'Y' //진척도 갱신 여부
			, tmprStrgYn : tmpChk//임시저장 여부
			,hireRgllbrOfc : SBUxMethod.get('dtl-inp-hireRgllbrOfc')
			,hireRgllbrSpt : SBUxMethod.get('dtl-inp-hireRgllbrSpt')

			,hireTmprWgTotSum : SBUxMethod.get('dtl-inp-hireTmprWgTotSum')
			,hireTmprAvgWg : SBUxMethod.get('dtl-inp-hireTmprAvgWg')

			,hireTmprMin : SBUxMethod.get('dtl-inp-hireTmprMin')
			,hireTmprMax : SBUxMethod.get('dtl-inp-hireTmprMax')

			,hireFrgnrMin : SBUxMethod.get('dtl-inp-hireFrgnrMin')
			,hireFrgnrMax : SBUxMethod.get('dtl-inp-hireFrgnrMax')
			,hireFrgnrAvg : SBUxMethod.get('dtl-inp-hireFrgnrAvg')
			,hireFrgnrTaskCn : SBUxMethod.get('dtl-inp-hireFrgnrTaskCn')
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				//fn_search();
				//열려있는 탭이 APC전수조사 인 경우 진척도 갱신
				cfn_allTabPrgrsRefrash();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		console.log("insert result", data);
	}

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = async function(apc) {
		await fn_clearForm();
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
	}

</script>
</html>