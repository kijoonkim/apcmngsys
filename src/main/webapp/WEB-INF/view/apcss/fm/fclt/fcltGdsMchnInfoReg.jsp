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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 상품화설비현황</h3>
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
							<div><label>상품화설비현황 상세내역</label></div>

				<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 25%">
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 25%">
				</colgroup>
				<tbody>
					<tr>
						<th>선별기</th>
						<th>보유현황</th>
						<th>규격</th>
						<th>당도기</th>
						<th>색택선별(O/X)</th>
						<th>형상선별</th>
						<th>가공설비</th>
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
							<sbux-input id="srch-inp-opera1_2" name="srch-inp-opera1_2" uitype="text" class="form-control input-sm" group-id="group1" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td>
							<sbux-select name="srch-inp-opera1_3" id="srch-inp-opera1_3" group-id="group1">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera1_4" id="srch-inp-opera1_4" group-id="group1">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera1_5" id="srch-inp-opera1_5" group-id="group1">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera1_6" name="srch-inp-opera1_6" uitype="text" class="form-control input-sm" group-id="group1" placeholder="착즙기, 커팅기 등" ></sbux-input>
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
							<sbux-input id="srch-inp-opera2_2" name="srch-inp-opera2_2" uitype="text" class="form-control input-sm" group-id="group2" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td>
							<sbux-select name="srch-inp-opera2_3" id="srch-inp-opera2_3" group-id="group2">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera2_4" id="srch-inp-opera2_4" group-id="group2">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera2_5" id="srch-inp-opera2_5" group-id="group2">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2_6" name="srch-inp-opera2_6" uitype="text" class="form-control input-sm" group-id="group2" placeholder="착즙기, 커팅기 등" ></sbux-input>
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
							<sbux-input id="srch-inp-opera3_2" name="srch-inp-opera3_2" uitype="text" class="form-control input-sm" group-id="group3" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td>
							<sbux-select name="srch-inp-opera3_3" id="srch-inp-opera3_3" group-id="group3">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera3_4" id="srch-inp-opera3_4" group-id="group3">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera3_5" id="srch-inp-opera3_5" group-id="group3">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3_6" name="srch-inp-opera3_6" uitype="text" class="form-control input-sm" group-id="group3" placeholder="착즙기, 커팅기 등" ></sbux-input>
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
							<sbux-input id="srch-inp-opera4_2" name="srch-inp-opera4_2" uitype="text" class="form-control input-sm" group-id="group4" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td>
							<sbux-select name="srch-inp-opera4_3" id="srch-inp-opera4_3" group-id="group4">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera4_4" id="srch-inp-opera4_4" group-id="group4">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-select name="srch-inp-opera4_5" id="srch-inp-opera4_5" group-id="group4">
                                <option value="0">(선택)</option>
                                <option value="1">O</option>
                                <option value="2">X</option>
                            </sbux-select>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4_6" name="srch-inp-opera4_6" uitype="text" class="form-control input-sm" group-id="group4" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
					</tr>

				</tbody>
			</table>
			</div>
				<div><label>* 해당 APC에서 소유하고 있는 품목별 선별기 모두 기재</label></div>
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

		fn_setGrdGdsMcList();

		SBUxMethod.changeGroupAttr('group1','disabled','true');
		SBUxMethod.changeGroupAttr('group2','disabled','true');
		SBUxMethod.changeGroupAttr('group3','disabled','true');
		SBUxMethod.changeGroupAttr('group4','disabled','true');

	})

	    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdGdsMcList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdGdsMcList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltGdsMchnInfoList.do", {
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
			console.log(data);
        	data.resultList.forEach((item, index) => {
        		SBUxMethod.set('srch-inp-opera1_1',item.sortMchnHldYn11);
        		SBUxMethod.set('srch-inp-opera1_2',item.sortMchnSpcfct1);
        		SBUxMethod.set('srch-inp-opera1_3',item.sortMchnHldYn12);
        		SBUxMethod.set('srch-inp-opera1_4',item.sortMchnHldYn13);
        		SBUxMethod.set('srch-inp-opera1_5',item.sortMchnHldYn14);
        		SBUxMethod.set('srch-inp-opera1_6',item.sortMchnHldYn15);
        		SBUxMethod.set('srch-inp-opera2_1',item.sortMchnHldYn21);
        		SBUxMethod.set('srch-inp-opera2_2',item.sortMchnSpcfct2);
        		SBUxMethod.set('srch-inp-opera2_3',item.sortMchnHldYn22);
        		SBUxMethod.set('srch-inp-opera2_4',item.sortMchnHldYn23);
        		SBUxMethod.set('srch-inp-opera2_5',item.sortMchnHldYn24);
        		SBUxMethod.set('srch-inp-opera2_6',item.sortMchnHldYn25);
        		SBUxMethod.set('srch-inp-opera3_1',item.sortMchnHldYn31);
        		SBUxMethod.set('srch-inp-opera3_2',item.sortMchnSpcfct3);
        		SBUxMethod.set('srch-inp-opera3_3',item.sortMchnHldYn32);
        		SBUxMethod.set('srch-inp-opera3_4',item.sortMchnHldYn33);
        		SBUxMethod.set('srch-inp-opera3_5',item.sortMchnHldYn34);
        		SBUxMethod.set('srch-inp-opera3_6',item.sortMchnHldYn35);
        		SBUxMethod.set('srch-inp-opera4_1',item.sortMchnHldYn41);
        		SBUxMethod.set('srch-inp-opera4_2',item.sortMchnSpcfct4);
        		SBUxMethod.set('srch-inp-opera4_3',item.sortMchnHldYn42);
        		SBUxMethod.set('srch-inp-opera4_4',item.sortMchnHldYn43);
        		SBUxMethod.set('srch-inp-opera4_5',item.sortMchnHldYn44);
        		SBUxMethod.set('srch-inp-opera4_6',item.sortMchnHldYn45);

        		if(item.sortMchnHldYn11 == '1'){SBUxMethod.changeGroupAttr('group1','disabled','false');}
        		if(item.sortMchnHldYn21 == '1'){SBUxMethod.changeGroupAttr('group2','disabled','false');}
        		if(item.sortMchnHldYn31 == '1'){SBUxMethod.changeGroupAttr('group3','disabled','false');}
        		if(item.sortMchnHldYn41 == '1'){SBUxMethod.changeGroupAttr('group4','disabled','false');}
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

    //신규등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;
		 console.log(SBUxMethod.get('srch-inp-trgtYr'));
    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltGdsMchnInfo.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
    		,sortMchnHldYn11 : SBUxMethod.get('srch-inp-opera1_1')
        	,sortMchnSpcfct1 : SBUxMethod.get('srch-inp-opera1_2')
        	,sortMchnHldYn12 : SBUxMethod.get('srch-inp-opera1_3')
        	,sortMchnHldYn13 : SBUxMethod.get('srch-inp-opera1_4')
        	,sortMchnHldYn14 : SBUxMethod.get('srch-inp-opera1_5')
        	,sortMchnHldYn15 : SBUxMethod.get('srch-inp-opera1_6')
        	,sortMchnHldYn21 : SBUxMethod.get('srch-inp-opera2_1')
        	,sortMchnSpcfct2 : SBUxMethod.get('srch-inp-opera2_2')
        	,sortMchnHldYn22 : SBUxMethod.get('srch-inp-opera2_3')
        	,sortMchnHldYn23 : SBUxMethod.get('srch-inp-opera2_4')
        	,sortMchnHldYn24 : SBUxMethod.get('srch-inp-opera2_5')
        	,sortMchnHldYn25 : SBUxMethod.get('srch-inp-opera2_6')
        	,sortMchnHldYn31 : SBUxMethod.get('srch-inp-opera3_1')
        	,sortMchnSpcfct3 : SBUxMethod.get('srch-inp-opera3_2')
        	,sortMchnHldYn32 : SBUxMethod.get('srch-inp-opera3_3')
        	,sortMchnHldYn33 : SBUxMethod.get('srch-inp-opera3_4')
        	,sortMchnHldYn34 : SBUxMethod.get('srch-inp-opera3_5')
        	,sortMchnHldYn35 : SBUxMethod.get('srch-inp-opera3_6')
        	,sortMchnHldYn41 : SBUxMethod.get('srch-inp-opera4_1')
        	,sortMchnSpcfct4 : SBUxMethod.get('srch-inp-opera4_2')
        	,sortMchnHldYn42 : SBUxMethod.get('srch-inp-opera4_3')
        	,sortMchnHldYn43 : SBUxMethod.get('srch-inp-opera4_4')
        	,sortMchnHldYn44 : SBUxMethod.get('srch-inp-opera4_5')
        	,sortMchnHldYn45 : SBUxMethod.get('srch-inp-opera4_6')
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