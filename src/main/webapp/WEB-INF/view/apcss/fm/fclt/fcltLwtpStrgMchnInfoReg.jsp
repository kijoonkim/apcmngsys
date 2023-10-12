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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 저온저장고운영</h3>
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
			<div><label>저온저장고운영 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 9%">
					<col style="width: 7%">
					<col style="width: 21%">
					<col style="width: 21%">
					<col style="width: 21%">
					<col style="width: 21%">
				</colgroup>
				<tbody>
					<tr>
						<th></th>
						<th>보유현황</th>
						<th>저장능력(톤)<br>
							*최대저장<br>
						</th>
						<th>단기저장실적(톤)<br>
							*단순 출하대기<br>
						</th>
						<th>
							장기저장실적(톤)<br>
							*1개월 이상<br>
						</th>
						<th>
							저장가동률(%)<br>
							*(단기+장기실적)/능력*100<br>
						</th>
					</tr>
					<tr>
						<td style="text-align: center;"><p>저온저장고</p></td>
						<td>
							<sbux-select name="srch-inp-opera1" id="srch-inp-opera1">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td><sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="1,000" ></sbux-input></td>
						<td><sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="100" ></sbux-input></td>
						<td><sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="2,000" ></sbux-input></td>
						<td><sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm" placeholder="210" ></sbux-input></td>
					</tr>
				</tbody>
			</table>
			</div>
				<br>
				<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 22%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">


						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th></th>
							<th class="text-center">없음</th>
							<th class="text-center">1월</th>
							<th class="text-center">2월</th>
							<th class="text-center">3월</th>
							<th class="text-center">4월</th>
							<th class="text-center">5월</th>
							<th class="text-center">6월</th>
							<th class="text-center">7월</th>
							<th class="text-center">8월</th>
							<th class="text-center">9월</th>
							<th class="text-center">10월</th>
							<th class="text-center">11월</th>
							<th class="text-center">12월</th>
						</tr>
						<tr>
							<th>저온저장고<br>비수기기간
							</th>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_1" name="warehouseSeCd-chk-mon_1_1"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_2" name="warehouseSeCd-chk-mon_1_2" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_3" name="warehouseSeCd-chk-mon_1_3" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_4" name="warehouseSeCd-chk-mon_1_4" uitype="normal" true-value = "1" false-value = "0" ></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_5" name="warehouseSeCd-chk-mon_1_5" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_6" name="warehouseSeCd-chk-mon_1_6" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_7" name="warehouseSeCd-chk-mon_1_7" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_8" name="warehouseSeCd-chk-mon_1_8" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_9" name="warehouseSeCd-chk-mon_1_9" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_10" name="warehouseSeCd-chk-mon_1_10" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_11" name="warehouseSeCd-chk-mon_1_11" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_12" name="warehouseSeCd-chk-mon_1_12" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-mon_1_13" name="warehouseSeCd-chk-mon_1_13" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
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
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		}
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

    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltLwtpStrgMchnInfo.do", {
    			trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    			,apcCd : SBUxMethod.get('srch-inp-apcCd')
    			,fcltHldYn: SBUxMethod.get('srch-inp-opera1')
    			,storCap: SBUxMethod.get('srch-inp-opera2')
    			,stStorPerfm: SBUxMethod.get('srch-inp-opera3')
    			,ltStorPerfm: SBUxMethod.get('srch-inp-opera4')
    			,storOpRate: SBUxMethod.get('srch-inp-opera5')
		});

        const data = await postJsonPromise;

   	 	const postJsonPromise1 = gfn_postJSON("/fm/fclt/insertFcltLwtpStrgMchnOperInfo.do", {
			trgtYr : SBUxMethod.get('srch-inp-trgtYr')
			,apcCd : SBUxMethod.get('srch-inp-apcCd')
			,fcltHldYn: SBUxMethod.get('srch-inp-opera1')
			,FCLT_OPER_YN : $('#warehouseSeCd-chk-mon_1_1').val()
	 		,FCLT_OPER_YN1 : $('#warehouseSeCd-chk-mon_1_2').val()
	 		,FCLT_OPER_YN2 : $('#warehouseSeCd-chk-mon_1_3').val()
	 		,FCLT_OPER_YN3 : $('#warehouseSeCd-chk-mon_1_4').val()
	 		,FCLT_OPER_YN4 : $('#warehouseSeCd-chk-mon_1_5').val()
	 		,FCLT_OPER_YN5 : $('#warehouseSeCd-chk-mon_1_6').val()
	 		,FCLT_OPER_YN6 : $('#warehouseSeCd-chk-mon_1_7').val()
	 		,FCLT_OPER_YN7 : $('#warehouseSeCd-chk-mon_1_8').val()
	 		,FCLT_OPER_YN8 : $('#warehouseSeCd-chk-mon_1_9').val()
	 		,FCLT_OPER_YN9 : $('#warehouseSeCd-chk-mon_1_10').val()
	 		,FCLT_OPER_YN10 : $('#warehouseSeCd-chk-mon_1_11').val()
	 		,FCLT_OPER_YN11 : $('#warehouseSeCd-chk-mon_1_12').val()
	 		,FCLT_OPER_YN12 : $('#warehouseSeCd-chk-mon_1_13').val()
		});

   	 	const data1 = await postJsonPromise1;

        try {
        	if (_.isEqual("S", data.resultStatus) && _.isEqual("S", data1.resultStatus) ) {
        		alert("처리 되었습니다.");
        		//fn_search();
        	} else {
        		if(!_.isEqual("S", data.resultStatus)){
	        		alert(data.resultMessage);
        		}else if(!_.isEqual("S", data1.resultStatus)){
        			alert(data1.resultMessage);
        		}
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