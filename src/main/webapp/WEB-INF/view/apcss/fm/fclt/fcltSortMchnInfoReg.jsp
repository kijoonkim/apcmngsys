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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 선별기운영</h3>
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
				<div><label>선별기현황 상세내역</label></div>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:0px;"></div>
				</div>
			<br>
							<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 20%">
					<col style="width: 20%">
					<col style="width: 20%">
					<col style="width: 20%">
				</colgroup>
				<tbody>
					<tr>
						<th>선별기</th>
						<th>보유현황</th>
						<th>처리능력(톤)</th>
						<th>처리물량(톤)</th>
						<th>연간가동시간(시간)</th>
						<th>평균가동일수<br>
							<p>*연간가동시간/4시간</p><br>
						</th>
					</tr>
					<tr>
						<th>품목1</th>
						<td>
							<sbux-select name="srch-inp-opera1_1" id="srch-inp-opera1_1" onchange ="fn_selectOnchange(this,'group1')">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera1_2" name="srch-inp-opera1_2" uitype="text" class="form-control input-sm" group-id="group1" placeholder="35  1일(8h)처리능력" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera1_3" name="srch-inp-opera1_3" uitype="text" class="form-control input-sm" group-id="group1" placeholder="2,200 연간처리실적" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera1_4" name="srch-inp-opera1_4" uitype="text" class="form-control input-sm" group-id="group1" placeholder="440" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera1_5" name="srch-inp-opera1_5" uitype="text" class="form-control input-sm" group-id="group1" placeholder="110" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>품목2</th>
						<td>
							<sbux-select name="srch-inp-opera2_1" id="srch-inp-opera2_1" onchange ="fn_selectOnchange(this,'group2')">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2_2" name="srch-inp-opera2_2" uitype="text" class="form-control input-sm" group-id="group2" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2_3" name="srch-inp-opera2_3" uitype="text" class="form-control input-sm" group-id="group2" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2_4" name="srch-inp-opera2_4" uitype="text" class="form-control input-sm" group-id="group2" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2_5" name="srch-inp-opera2_5" uitype="text" class="form-control input-sm" group-id="group2" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>품목3</th>
						<td>
							<sbux-select name="srch-inp-opera3_1" id="srch-inp-opera3_1" onchange ="fn_selectOnchange(this,'group3')">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3_2" name="srch-inp-opera3_2" uitype="text" class="form-control input-sm" group-id="group3" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3_3" name="srch-inp-opera3_3" uitype="text" class="form-control input-sm" group-id="group3" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3_4" name="srch-inp-opera3_4" uitype="text" class="form-control input-sm" group-id="group3" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3_5" name="srch-inp-opera3_5" uitype="text" class="form-control input-sm" group-id="group3" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>기타</th>
						<td>
							<sbux-select name="srch-inp-opera4_1" id="srch-inp-opera4_1" onchange ="fn_selectOnchange(this,'group4')">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4_2" name="srch-inp-opera4_2" uitype="text" class="form-control input-sm" group-id="group4" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4_3" name="srch-inp-opera4_3" uitype="text" class="form-control input-sm" group-id="group4" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4_4" name="srch-inp-opera4_4" uitype="text" class="form-control input-sm" group-id="group4" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4_5" name="srch-inp-opera4_5" uitype="text" class="form-control input-sm" group-id="group4" placeholder="" ></sbux-input>
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

		SBUxMethod.changeGroupAttr('group1','disabled','true');
		SBUxMethod.changeGroupAttr('group2','disabled','true');
		SBUxMethod.changeGroupAttr('group3','disabled','true');
		SBUxMethod.changeGroupAttr('group4','disabled','true');
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
    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltSortMchnInfo.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
            , sortMchnHldYn1 :  SBUxMethod.get('srch-inp-opera1_1')
            , sortMchnHldYn2 :  SBUxMethod.get('srch-inp-opera2_1')
            , sortMchnHldYn3 :  SBUxMethod.get('srch-inp-opera3_1')
            , sortMchnHldYn4 :  SBUxMethod.get('srch-inp-opera4_1')
            , prcCap1 :  SBUxMethod.get('srch-inp-opera1_2')
            , prcCap2 :  SBUxMethod.get('srch-inp-opera2_2')
            , prcCap3 :  SBUxMethod.get('srch-inp-opera3_2')
            , prcCap4 :  SBUxMethod.get('srch-inp-opera4_2')
            , prcVol1 :  SBUxMethod.get('srch-inp-opera1_3')
            , prcVol2 :  SBUxMethod.get('srch-inp-opera2_3')
            , prcVol3 :  SBUxMethod.get('srch-inp-opera3_3')
            , prcVol4 :  SBUxMethod.get('srch-inp-opera4_3')
            , annOperHr1 :  SBUxMethod.get('srch-inp-opera1_4')
            , annOperHr2 :  SBUxMethod.get('srch-inp-opera2_4')
            , annOperHr3 :  SBUxMethod.get('srch-inp-opera3_4')
            , annOperHr4 :  SBUxMethod.get('srch-inp-opera4_4')
            , avgOperDay1 :  SBUxMethod.get('srch-inp-opera1_5')
            , avgOperDay2 :  SBUxMethod.get('srch-inp-opera2_5')
            , avgOperDay3 :  SBUxMethod.get('srch-inp-opera3_5')
            , avgOperDay4 :  SBUxMethod.get('srch-inp-opera4_5')
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

	//품종 유무 선택시 작성가능 아닐시 데이테 리셋
    function fn_selectOnchange(e,groupId){
    	//console.log("============fn_selectOnchange==============");

    	if($(e).val() == 1){
    		SBUxMethod.changeGroupAttr(groupId,'disabled','false');
    	}else{
    		SBUxMethod.changeGroupAttr(groupId,'disabled','true');
    		SBUxMethod.clearGroupData(groupId);
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