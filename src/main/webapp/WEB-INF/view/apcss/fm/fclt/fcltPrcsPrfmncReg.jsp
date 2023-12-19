<%
 /**
  * @Class Name : fcltPrcsPrfmncReg.jsp
  * @Description : 5.3.산지유통시설처리실적 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 산지유통처리실적 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<br>
		<br>
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

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:0px;"></div>
				</div>

							<br>
			<div><label>산지유통처리실적상세 상세내역 </label></div>
			<div>
				<label style="font-size: x-small; font-weight: bold;">◦ (산지유통시설 처리실적) </label>
				<label style="font-size: x-small;"> 유통조직의 취급액 실적 중 APC에서 선별‧포장 등의 상품화 및/ 또는 장기저장 과정을 실시하여 판매한 실적을 기재</label>
			</div>
			<div>
				<label style="font-size: x-small;">- APC에서 처리한 상품 : 원물 집하, 저온저장, 선별, 신선처리, 포장 등의 단계를 필수 또는 선택적으로 거친 상품을 말함</label>
				<label style="font-size: x-small; text-decoration: underline;">(단, 농가 개별선별 상품의 운송을 위한 단순수탁 실적은 제외)</label>
			</div>
			<div>
				<label style="font-size: x-small; font-weight: bold;">․ (일반취급)  </label>
				<label style="font-size: x-small;"> 단순 매취 등의 물량 중 APC에서 저온저장, 신선처리, 포장 등의 처리를 거친 물량만 기재</label>
			</div>
			<div>
				<table class="table table-bordered table-hover tbl_col tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 22%">
						<col style="width: 22%">
						<col style="width: 22%">
						<col style="width: 22%">
					</colgroup>
						<thead>
							<tr>
								<th rowspan="2">구분</th>
								<th rowspan="2">APC 취급액</th>
								<th rowspan="2">APC 일반취급<br>(단순 매취 등)</th>
								<th colspan="2">APC 조직화취급</th>
							</tr>
							<tr>
								<th>공선수탁</th>
								<th>계약매취</th>
							</tr>
							<tr>
								<td>금액(백만원)</td>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera2',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera3',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera4',1)"></sbux-input>
								</td>
							</tr>

						</thead>
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
		fn_selectAtMcIfList();
	});

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_selectAtMcIfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltPrcsPrfmncList.do", {
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
        		SBUxMethod.set('srch-inp-opera1',item.fcltPrcsTrmtAmt);
        		SBUxMethod.set('srch-inp-opera2',item.fcltPrcsTrmtAmt2);
        		SBUxMethod.set('srch-inp-opera3',item.fcltPrcsTrmtAmt3);
        		SBUxMethod.set('srch-inp-opera4',item.fcltPrcsTrmtAmt4);
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltPrcsPrfmnc.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
    		,fcltPrcsTrmtAmt : SBUxMethod.get('srch-inp-opera1')
    		,fcltPrcsTrmtAmt2 : SBUxMethod.get('srch-inp-opera2')
    		,fcltPrcsTrmtAmt3 : SBUxMethod.get('srch-inp-opera3')
    		,fcltPrcsTrmtAmt4 : SBUxMethod.get('srch-inp-opera4')
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
    function sum(name, idx){
    	extractNumbers2(name);

    	let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera2'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))
    				+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera4'));
    	SBUxMethod.set('srch-inp-opera1',sum);
    }

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}
    // 숫자만 입력
	function extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
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