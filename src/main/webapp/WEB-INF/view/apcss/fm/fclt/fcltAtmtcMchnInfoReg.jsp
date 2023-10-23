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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 스마트자동화</h3>
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
				<div><label>스마트자동화 상세내역</label></div>
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 50%">
							<col style="width: 50%">
						</colgroup>
						<tbody>
							<tr>
								<th>설비</th>
								<th>해당 설비 설치 여부</th>
							</tr>
							<tr>
								<td>규격</td>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="예시) 2대x1조 32등급" ></sbux-input>
								</td>
							</tr>
							<tr>
								<td>디팔렛타이저</td>
								<td>
									<sbux-select name="srch-inp-opera2" id="srch-inp-opera2">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동덤핑기</td>
								<td>
									<sbux-select name="srch-inp-opera3" id="srch-inp-opera3">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>전자식 중량 선별기</td>
								<td>
									<sbux-select name="srch-inp-opera4" id="srch-inp-opera4">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>비파괴 당도 선별기</td>
								<td>
									<sbux-select name="srch-inp-opera5" id="srch-inp-opera5">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>등급별 원물 자동 이송 장치</td>
								<td>
									<sbux-select name="srch-inp-opera6" id="srch-inp-opera6">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>공박스(망․톤백 등) 자동 배출 장치</td>
								<td>
									<sbux-select name="srch-inp-opera7" id="srch-inp-opera7">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동 박스(망․톤백 등) 포장기</td>
								<td>
									<sbux-select name="srch-inp-opera8" id="srch-inp-opera8">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동 소포장기</td>
								<td>
									<sbux-select name="srch-inp-opera9" id="srch-inp-opera9">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동랩핑기</td>
								<td>
									<sbux-select name="srch-inp-opera10" id="srch-inp-opera10">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동 중량체크기(포장 시)</td>
								<td>
									<sbux-select name="srch-inp-opera11" id="srch-inp-opera11">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>팔렛타이저(로봇팔 등)</td>
								<td>
									<sbux-select name="srch-inp-opera12" id="srch-inp-opera12">
		                                <option>(선택)</option>
		                                <option value="1">있음</option>
		                                <option value="2">없음</option>
		                            </sbux-select>
								</td>
							</tr>
							<tr>
								<td>기타 가공설비</td>
								<td>
									<sbux-input id="srch-inp-opera13" name="srch-inp-opera13" uitype="text" class="form-control input-sm" placeholder="예시)착즙기, 커팅기 등" ></sbux-input>
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
		fn_selectAtMcIfList();
	})

	    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_selectAtMcIfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltAtmtcMchnInfoList.do", {
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
        		SBUxMethod.set('srch-inp-opera1',item.specs);
        		SBUxMethod.set('srch-inp-opera2',item.fcltHldYn);
        		SBUxMethod.set('srch-inp-opera3',item.fcltHldYn2);
        		SBUxMethod.set('srch-inp-opera4',item.fcltHldYn3);
        		SBUxMethod.set('srch-inp-opera5',item.fcltHldYn4);
        		SBUxMethod.set('srch-inp-opera6',item.fcltHldYn5);
        		SBUxMethod.set('srch-inp-opera7',item.fcltHldYn6);
        		SBUxMethod.set('srch-inp-opera8',item.fcltHldYn7);
        		SBUxMethod.set('srch-inp-opera9',item.fcltHldYn8);
        		SBUxMethod.set('srch-inp-opera10',item.fcltHldYn9);
        		SBUxMethod.set('srch-inp-opera11',item.fcltHldYn10);
        		SBUxMethod.set('srch-inp-opera12',item.fcltHldYn11);
        		SBUxMethod.set('srch-inp-opera13',item.otherFclt);
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


		//alert('준비중');
    	fn_subInsert(confirm("등록 하시겠습니까?"));
    }

    //신규등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;
		 console.log(SBUxMethod.get('srch-inp-trgtYr'));
    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltAtmtcMchnInfo.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
    		,specs : SBUxMethod.get('srch-inp-opera1')
    		,fcltHldYn : SBUxMethod.get('srch-inp-opera2')
    		,fcltHldYn2 : SBUxMethod.get('srch-inp-opera3')
    		,fcltHldYn3 : SBUxMethod.get('srch-inp-opera4')
    		,fcltHldYn4 : SBUxMethod.get('srch-inp-opera5')
    		,fcltHldYn5 : SBUxMethod.get('srch-inp-opera6')
    		,fcltHldYn6 : SBUxMethod.get('srch-inp-opera7')
    		,fcltHldYn7 : SBUxMethod.get('srch-inp-opera8')
    		,fcltHldYn8 : SBUxMethod.get('srch-inp-opera9')
    		,fcltHldYn9 : SBUxMethod.get('srch-inp-opera10')
    		,fcltHldYn10 : SBUxMethod.get('srch-inp-opera11')
    		,fcltHldYn11 : SBUxMethod.get('srch-inp-opera12')
    		,otherFclt : SBUxMethod.get('srch-inp-opera13')

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