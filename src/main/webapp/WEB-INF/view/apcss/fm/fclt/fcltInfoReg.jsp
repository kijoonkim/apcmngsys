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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 시설현황</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>

		<div class="box-body">
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

			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-spmtDsctn" style="height:0px;"></div>
			</div>
			<br>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>시설현황</caption>
				<colgroup>
					<col style="width: 30%">
					<col style="width: 35%">
					<col style="width: 35%">
				</colgroup>
				<tbody>
					<tr>
						<th>구분</th>
						<th>면적(㎡)</th>
						<th>비고</th>
					</tr>
					<tr>
						<th>총 건축면적</th>
						<td>
							<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="자동" data-info="total" readonly ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="예) 1개 동" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>집하선별포장장</th>
						<td>
							<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm sum"onkeyup="sumNumbers(this)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>세척․가공 등 처리</th>
						<td>
							<sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)"  ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>비상품화시설</th>
						<td>
							<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)"  ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text" class="form-control input-sm"placeholder="사무실, 회의실, 화장실 등"></sbux-input>
						</td>
					</tr>
					<tr>
						<th>폐기물 처리</th>
						<td>
							<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)"  ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>예냉고</th>
						<td>
							<sbux-input id="srch-inp-opera11" name="srch-inp-opera11" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera12" name="srch-inp-opera12" uitype="text" class="form-control input-sm" placeholder="예시) 3칸 ✕ 100m²"></sbux-input>
						</td>
					</tr>
					<tr>
						<th>저온저장</th>
						<td>
							<sbux-input id="srch-inp-opera13" name="srch-inp-opera13" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera14" name="srch-inp-opera14" uitype="text" class="form-control input-sm"
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>CA저장고</th>
						<td>
							<sbux-input id="srch-inp-opera15" name="srch-inp-opera15" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera16" name="srch-inp-opera16" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>큐어링</th>
						<td>
							<sbux-input id="srch-inp-opera17" name="srch-inp-opera17" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera18" name="srch-inp-opera18" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>일반저장</th>
						<td>
							<sbux-input id="srch-inp-opera19" name="srch-inp-opera19" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera20" name="srch-inp-opera20" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>

					<tr>
						<th>기타사항</th>
						<td>
							<sbux-input id="srch-inp-opera21" name="srch-inp-opera21" uitype="text" class="form-control input-sm sum" onkeyup="sumNumbers(this)"></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera22" name="srch-inp-opera22" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
				</tbody>
			</table>
			 <p>* 복수동으로 분리된 경우 합산하여 기재</p>
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

	});

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

		let yearArr = document.querySelectorAll("input[data-year='0']");
		yearArr.forEach(e => {
			if(e.value != "" && e.value.length != 4){
				alert("사업연도는 네자리로 작성해주세요. 예) 2023");
				result++;
				return e.focus();
			}
		});


    	fn_subInsert(confirm("등록 하시겠습니까?"));
    }


    //신규등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInfo.do", {
	    	trgtYr: SBUxMethod.get("srch-inp-trgtYr")  // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
		 ,	apcCd: SBUxMethod.get("srch-inp-apcCd") // 상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
         ,	fcltAreaTot: SBUxMethod.get('srch-inp-opera1')
         ,	fcltRmrkTot: SBUxMethod.get('srch-inp-opera2')
         ,	fcltArea01: SBUxMethod.get('srch-inp-opera3')
         ,	fcltRmrk01: SBUxMethod.get('srch-inp-opera4')
         ,	fcltArea02: SBUxMethod.get('srch-inp-opera5')
         ,	fcltRmrk02: SBUxMethod.get('srch-inp-opera6')
         ,	fcltArea03: SBUxMethod.get('srch-inp-opera7')
         ,	fcltRmrk03: SBUxMethod.get('srch-inp-opera8')
         ,	fcltArea04: SBUxMethod.get('srch-inp-opera9')
         ,	fcltRmrk04: SBUxMethod.get('srch-inp-opera10')
         ,	fcltArea05: SBUxMethod.get('srch-inp-opera11')
         ,	fcltRmrk05: SBUxMethod.get('srch-inp-opera12')
         ,	fcltArea06: SBUxMethod.get('srch-inp-opera13')
         ,	fcltRmrk06: SBUxMethod.get('srch-inp-opera14')
         ,	fcltArea07: SBUxMethod.get('srch-inp-opera15')
         ,	fcltRmrk07: SBUxMethod.get('srch-inp-opera16')
         ,	fcltArea08: SBUxMethod.get('srch-inp-opera17')
         ,	fcltRmrk08: SBUxMethod.get('srch-inp-opera18')
         ,	fcltArea09: SBUxMethod.get('srch-inp-opera19')
         ,	fcltRmrk09: SBUxMethod.get('srch-inp-opera20')
         ,	fcltArea10: SBUxMethod.get('srch-inp-opera21')
         ,	fcltRmrk10: SBUxMethod.get('srch-inp-opera22')
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

    //면적 합산
	function sumNumbers(e) {
        extractNumbers2(e);

        let sum = 0;

        document.querySelectorAll("input.sum").forEach(e =>{
        	sum += e.value/1;
        });
        console.log(sum.toFixed(1));
        //$("sbux-input[data-info='total']").val(sum.toFixed(1));
        SBUxMethod.set("srch-inp-opera1", sum.toFixed(1));
        //data-info="total"
    }

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(e) {
		let chkVal = $(e).val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
		$(e).val(chkVal);
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