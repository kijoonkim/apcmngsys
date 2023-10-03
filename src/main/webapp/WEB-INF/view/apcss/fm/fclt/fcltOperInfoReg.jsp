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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 운영자개요</h3>
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
					<caption>APC 등록</caption>
					<colgroup>
						<col style="width: 35%">
						<col style="width: 65%">
					</colgroup>
					<tbody>
						<tr>
							<th>구분</th>
							<th>내용</th>
						</tr>
						<tr>
							<th>소유조직명</th>
							<td>
								<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>소유조직 사업자번호</th>
							<td>
								<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="소유자가 지자체로 사업자번호 없을 경우 공란" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직명</th>
							<td>
								<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="최초 페이 내용 그대로 끌어오기" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 사업자번호</th>
							<td>
								<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 대표자</th>
							<td>
								<sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 주소</th>
							<td>
								<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="주소 검색하여 작성" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 조직유형</th>
							<td>
								<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="생산유통통합조직(승인함),생산유통통합조직(육성형),생산유통통합조직(승인형)-출자출하조직, 생산유통통합조직(육성형)-출자출하조직,개별조직" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목1</th>
							<td>
								<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="운영조직 취급액 중 가장많은 품목 1
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목2</th>
							<td>
								<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / 운영조직 취급액 중 가장많은 품목 2
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목3</th>
							<td>
								<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / 운영조직 취급액 중 가장많은 품목 3
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 기타품목</th>
							<td>
								<sbux-input id="srch-inp-opera11" name="srch-inp-opera11" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC 사업자번호</th>
							<td>
								<sbux-input id="srch-inp-opera13" name="srch-inp-opera13" uitype="text" class="form-control input-sm" placeholder="사업자번호 없을 경우 공란
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC 주소</th>
							<td>
								<sbux-input id="srch-inp-opera14" name="srch-inp-opera14" uitype="text" class="form-control input-sm" placeholder="주소 검색하여 작성
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목1</th>
							<td>
								<sbux-input id="srch-inp-opera15" name="srch-inp-opera15" uitype="text" class="form-control input-sm" placeholder="APC 취급액 중 가장많은 품목 1
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목2</th>
							<td>
								<sbux-input id="srch-inp-opera16" name="srch-inp-opera16" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / APC 취급액 중 가장많은 품목 2
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목3</th>
							<td>
								<sbux-input id="srch-inp-opera17" name="srch-inp-opera17" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / APC 취급액 중 가장많은 품목 3
								" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC 처리 기타품목명</th>
							<td>
								<sbux-input id="srch-inp-opera18" name="srch-inp-opera18" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력
								" ></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
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

	})
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


    	if (SBUxMethod.get("srch-inp-opera8") == null || SBUxMethod.get("srch-inp-opera8") == undefined || SBUxMethod.get("srch-inp-opera8") == "") {
    		alert("'운영조직 취급 대표품목1'과 'APC 처리 대표품목1'은 필수로 작성해주셔야 합니다.");
            return;
        }
		//2,4 사업자 번호
		var opera2 = !SBUxMethod.get("srch-inp-opera2");
		var opera4 = !SBUxMethod.get("srch-inp-opera4");
    	if (!SBUxMethod.get("srch-inp-opera4")) {
    		alert("사업자번호는 총 10자리입니다. 사업자번호를 올바르게 작성하였는지 확인해주세요.");
            return;
        }

    	fn_subInsert(confirm("등록 하시겠습니까?"));
    }


    //신규등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperInfo.do", {
      	 	trgtYr: SBUxMethod.get("srch-inp-trgtYr") , // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
         	apcCd: SBUxMethod.get("srch-inp-apcCd"), // 상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
         	psnOgnzNm : SBUxMethod.get("srch-inp-opera1") , //소유조직명
         	psnOgnzBrno : SBUxMethod.get("srch-inp-opera2") , //소유조직 사업자번호
         	operOgnzNm : SBUxMethod.get("srch-inp-opera3") , //운영조직명
         	operOgnzBrno : SBUxMethod.get("srch-inp-opera4") , //운영조직 사업자번호
         	operOgnzPic : SBUxMethod.get("srch-inp-opera5") , //운영조직 대표자
         	daddr : SBUxMethod.get("srch-inp-opera6") ,	//운영조직 주소
         	operOgnzDeptCd : SBUxMethod.get("srch-inp-opera7") , //운영조직 조직유형
         	operOgnzTrmtItemCn : SBUxMethod.get("srch-inp-opera8") , //운영조직 취급 대표품목1
         	operOgnzTrmtItemCn2 : SBUxMethod.get("srch-inp-opera9") , //운영조직 취급 대표품목2
         	operOgnzTrmtItemCn3 : SBUxMethod.get("srch-inp-opera10") , //운영조직 취급 대표품목3
         	operOgnzTrmtItemCn4 : SBUxMethod.get("srch-inp-opera11") , //운영조직 취급 기타품목
         	apcBrno : SBUxMethod.get("srch-inp-opera13") ,  //APC 사업자번호
         	apcAddr : SBUxMethod.get("srch-inp-opera14") ,	//APC 주소
         	apcTrmtItemCn : SBUxMethod.get("srch-inp-opera15") , // APC 처리 대표품목1
         	apcTrmtItemCn2 : SBUxMethod.get("srch-inp-opera16") , // APC 처리 대표품목2
         	apcTrmtItemCn3 : SBUxMethod.get("srch-inp-opera17") , // APC 처리 대표품목3
         	apcTrmtItemCn4 : SBUxMethod.get("srch-inp-opera18")  //  APC 처리 기타품목
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