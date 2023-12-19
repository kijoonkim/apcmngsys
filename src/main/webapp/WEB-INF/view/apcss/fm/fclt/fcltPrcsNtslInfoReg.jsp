<%
 /**
  * @Class Name : fcltPrcsNtslInfoReg.jsp
  * @Description : 5.5.산지유통시설처리상품주요판매처 화면
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
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 산지유통판매처 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<tbody>
					<tr>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td colspan= "3" class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-input id="srch-inp-trgtYr" name="srch-inp-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td colspan="5"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:0px;"></div>
				</div>
				<br>
			<div><label>산지유통판매처 상세내역</label></div>
			<div>
				<label style="font-size: x-small; font-weight: bold;">◦ (산지유통시설 처리상품 주요 판매처) </label>
				<label style="font-size: x-small;">출자·출하조직은 생산유통통합조직 통해서 판매한 실적 및 직접 판매한 실적을 합산하여 기재. 기타항목은 다른 유통조직에 판매한 금액</label>
			</div>
			<div style="display: flex; font-size: x-small;"><label style="margin-left:auto; ">(금액: 백만원)</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
					</colgroup>
						<tbody>
							<tr>
								<th>대형유통업체(백화점 포함)</th>
								<th>식자재업체<br>
								(학교급식, 가공업체 포함)<br>
								</th>
								<th>도매시장<br>(공판장 포함)</th>
								<th>소매업체 직판</th>
								<th>수출</th>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera1')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera2')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera3" name=""srch-inp-opera3"" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera3')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera4')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera5')"></sbux-input>
								</td>
							</tr>
							<tr>
								<th>홈쇼핑(TV매체)</th>
								<th>온라인B2B</th>
								<th>온라인(B2C)</th>
								<th>기타</th>
								<th>계</th>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera6')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera7')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera8')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera9')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
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
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-trgtYr", year);
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", '0122');
			//SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		fn_selectItmPrfList();
	});

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_selectItmPrfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingItmPrfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltPrcsNtslInfoList.do", {
			apcCd: apcCd,
        	trgtYr: trgtYr,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
        });

        const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
        try {
        	data.resultList.forEach((item, index) => {
        		SBUxMethod.set('srch-inp-opera1',item.fcltNtslCd);
        		SBUxMethod.set('srch-inp-opera2',item.fcltNtslCd2);
        		SBUxMethod.set('srch-inp-opera3',item.fcltNtslCd3);
        		SBUxMethod.set('srch-inp-opera4',item.fcltNtslCd4);
        		SBUxMethod.set('srch-inp-opera5',item.fcltNtslCd5);
        		SBUxMethod.set('srch-inp-opera6',item.fcltNtslCd6);
        		SBUxMethod.set('srch-inp-opera7',item.fcltNtslCd7);
        		SBUxMethod.set('srch-inp-opera8',item.fcltNtslCd8);
        		SBUxMethod.set('srch-inp-opera9',item.fcltNtslCd9);
			});
        	sum('srch-inp-opera1');

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
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");
		if (gfn_isEmpty(apcCd)) {
    		alert("apc를 선택해주세요");
            return;
        }
		if (gfn_isEmpty(trgtYr)) {
    		alert("대상연도를 작성해주세요");
            return;
        }

    	fn_subInsert(confirm("등록 하시겠습니까?"));
    }


	//신규 등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltPrcsNtslInfo.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
    		,fcltNtslCd : SBUxMethod.get('srch-inp-opera1')
    		,fcltNtslCd2 : SBUxMethod.get('srch-inp-opera2')
    		,fcltNtslCd3 : SBUxMethod.get('srch-inp-opera3')
    		,fcltNtslCd4 : SBUxMethod.get('srch-inp-opera4')
    		,fcltNtslCd5 : SBUxMethod.get('srch-inp-opera5')
    		,fcltNtslCd6 : SBUxMethod.get('srch-inp-opera6')
    		,fcltNtslCd7 : SBUxMethod.get('srch-inp-opera7')
    		,fcltNtslCd8 : SBUxMethod.get('srch-inp-opera8')
    		,fcltNtslCd9 : SBUxMethod.get('srch-inp-opera9')
		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		//fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
        // 결과 확인 후 재조회
        console.log("insert result", data);
    }


	//국고 지자체 자부담 합계
    function sum(name){
    	extractNumbers2(name);

    	let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera1'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera2'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera4'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera5'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera6'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera8'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera9'));
    	SBUxMethod.set('srch-inp-opera10',sum.toFixed(2));
    }

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(!inputValue === null || !inputValue === undefined || !inputValue === ''){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}
    // 숫자만 입력
	function extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(!inputValue === null || !inputValue === undefined || !inputValue === ''){
			SBUxMethod.set(input,inputValue.replace(/\D/g, ""));
		}
	}

	//값이 없는 경우 0 있는 경우 숫자로 반환
	function convertToNumberOrZero(value) {
	  // 값이 없는 경우 0으로 설정
	  if (value === undefined || value === null) {
	    return 0;
	  }

	  // 값이 있는 경우 숫자로 변환하고 반환
	  const numericValue = Number(value);
	  if (isNaN(numericValue)) {
	    return 0; // 변환 실패 시 0 반환
	  } else {
	    return numericValue;
	  }
	}

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}
</script>
</html>