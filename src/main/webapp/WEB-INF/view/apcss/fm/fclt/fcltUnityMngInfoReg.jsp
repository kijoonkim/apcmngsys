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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 통합관리시스템활용</h3>
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
			<div><label>통합관리시스템활용 상세내역</label></div>
			<div><label style="font-size: x-small;">- 활용하신다면 어떤 작업단계까지 활용하고 계십니까? 해당하는 곳에 체크해 주십시오</label></div>


			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 15%">
						<col style="width: 15%">
					</colgroup>
						<tbody>
							<tr>
								<th>생산정보</th>
								<th>입고정보</th>
								<th>선별정보</th>
								<th>저장정보</th>
								<th>포장정보</th>
								<th>출고정보</th>
								<th>정산정보</th>
							</tr>
							<tr>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera1" name="srch-inp-opera1" uitype="normal" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera2" name="srch-inp-opera2" uitype="normal" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera3" name="srch-inp-opera3" uitype="normal" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera4" name="srch-inp-opera4" uitype="normal" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera5" name="srch-inp-opera5" uitype="normal" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera6" name="srch-inp-opera6" uitype="normal" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera7" name="srch-inp-opera7" uitype="normal" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>

							</tr>
						</tbody>
					</table>
					</div>
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

    	fn_subInsert(confirm("등록 하시겠습니까?"));
    }

    //신규등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;
		 console.log(SBUxMethod.get('srch-inp-trgtYr'));
    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltUnityMngInfo.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
    		,fcltSysHldYn : $('#srch-inp-opera1').val()
    		,fcltSysHldYn2 : $('#srch-inp-opera2').val()
    		,fcltSysHldYn3 : $('#srch-inp-opera3').val()
    		,fcltSysHldYn4 : $('#srch-inp-opera4').val()
    		,fcltSysHldYn5 : $('#srch-inp-opera5').val()
    		,fcltSysHldYn6 : $('#srch-inp-opera6').val()
    		,fcltSysHldYn7 : $('#srch-inp-opera7').val()

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