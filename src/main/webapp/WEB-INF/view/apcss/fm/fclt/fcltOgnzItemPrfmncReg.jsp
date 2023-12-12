<%
 /**
  * @Class Name : fcltOgnzItemPrfmncReg.jsp
  * @Description : 5.2.유통조직품목별 처리실적 화면
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
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
				<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 유통조직품목처리실적 -->
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
			<div><label>유통조직품목처리실적 상세내역 </label></div>
			<div><label style="font-size: x-small;">- 유통조직 총취급액과 합계가 동일하게 작성</label></div>
			<div><label style="font-size: x-small;">- 품목1+품목2+품목3+기타 의 합계가 유통조직 총취급액의 합과 같아야함</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 24%">
						<col style="width: 38%">
						<col style="width: 38%">
					</colgroup>
						<tbody>
							<tr>
								<th>구분</th>
								<th>취급액(백만원)</th>
								<th>취급물량(톤)</th>
							</tr>
							<tr>
								<td>품목1</td>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera1',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera2',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>품목2</td>
								<td>
									<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera3',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera4',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>품목3</td>
								<td>
									<sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera5',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera6',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>기타</td>
								<td>
									<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera7',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera8',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>합계</td>
								<td>
									<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="상기수치합계" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="상기수치합계" readonly></sbux-input>
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
			//SBUxMethod.set("srch-inp-apcCd", '0122');
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		fn_selectOgItmPrfList();
	});

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_selectOgItmPrfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdOgItmPrfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOgnzItemPrfmncList.do", {
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
        		SBUxMethod.set('srch-inp-opera1',item.fcltOgnzTrmtAmt);
        		SBUxMethod.set('srch-inp-opera3',item.fcltOgnzTrmtAmt2);
        		SBUxMethod.set('srch-inp-opera5',item.fcltOgnzTrmtAmt3);
        		SBUxMethod.set('srch-inp-opera7',item.fcltOgnzTrmtAmt4);
        		SBUxMethod.set('srch-inp-opera2',item.fcltOgnzTrmtVlm);
        		SBUxMethod.set('srch-inp-opera4',item.fcltOgnzTrmtVlm2);
        		SBUxMethod.set('srch-inp-opera6',item.fcltOgnzTrmtVlm3);
        		SBUxMethod.set('srch-inp-opera8',item.fcltOgnzTrmtVlm4);
			});
        	sum('srch-inp-opera1',1);
        	sum('srch-inp-opera2',2);

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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOgnzItemPrfmnc.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
    		,fcltOgnzTrmtAmt : SBUxMethod.get('srch-inp-opera1')
    		,fcltOgnzTrmtAmt2 : SBUxMethod.get('srch-inp-opera3')
    		,fcltOgnzTrmtAmt3 : SBUxMethod.get('srch-inp-opera5')
    		,fcltOgnzTrmtAmt4 : SBUxMethod.get('srch-inp-opera7')
    		,fcltOgnzTrmtVlm : SBUxMethod.get('srch-inp-opera2')
    		,fcltOgnzTrmtVlm2 : SBUxMethod.get('srch-inp-opera4')
    		,fcltOgnzTrmtVlm3 : SBUxMethod.get('srch-inp-opera6')
    		,fcltOgnzTrmtVlm4 : SBUxMethod.get('srch-inp-opera8')
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

    	if(idx == 1 ){
    		let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera1'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera5'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7'));
    		SBUxMethod.set('srch-inp-opera9',sum);
    	}else if (idx == 2){
    		let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera2'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera4'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera6'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera8'));
			SBUxMethod.set('srch-inp-opera10',sum);
    	}
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