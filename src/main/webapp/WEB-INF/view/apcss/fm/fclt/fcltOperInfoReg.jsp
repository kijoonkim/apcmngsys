<%
 /**
  * @Class Name : fcltOperInfoReg.jsp
  * @Description : 1.운영자개요 화면
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
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 운영자개요 -->
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
									<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</td>
								<td>
									<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</td>
								<th scope="row">대상연도</th>
								<td class="td_input"  style="border-right: hidden;">
									<sbux-input id="srch-inp-trgtYr" name="srch-inp-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm" readonly></sbux-input>
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
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="srch-inp-itemCd1" name="srch-inp-itemCd1" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-itemNm1" name="srch-inp-itemNm1" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item1" name="srch-btn-item1" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(1)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목2</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="srch-inp-itemCd2" name="srch-inp-itemCd2" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-itemNm2" name="srch-inp-itemNm2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item2" name="srch-btn-item2" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(2)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="srch-inp-itemCd3" name="srch-inp-itemCd3" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-itemNm3" name="srch-inp-itemNm3" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item3" name="srch-btn-item3" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(3)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
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
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="srch-inp-itemCd4" name="srch-inp-itemCd4" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-itemNm4" name="srch-inp-itemNm4" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item4" name="srch-btn-item4" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(4)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목2</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="srch-inp-itemCd5" name="srch-inp-itemCd5" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-itemNm5" name="srch-inp-itemNm5" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item5" name="srch-btn-item5" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(5)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="srch-inp-itemCd6" name="srch-inp-itemCd6" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-itemNm6" name="srch-inp-itemNm6" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item6" name="srch-btn-item6" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(6)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
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
    <!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemSelect" name="modal-itemSelect" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemSelect" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/ItemSelectPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-trgtYr", year);
		//SBUxMethod.set("inp-apcCd", gv_apcCd);
		//SBUxMethod.set("srch-inp-apcCd", '0122');//test
		SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		//fn_selectFcltOperInfo();
	});



	const fn_selectFcltOperInfo = async function(){
		let date = new Date();
		//let apcCd = gv_apcCd;
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr  =  date.getFullYear();
    	let postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoList.do", {
    		apcCd : apcCd
    		,trgtYr : trgtYr
    	});

        let data = await postJsonPromise;
	    try{
	        if(data.resultList.length > 0){
				let resultVO = data.resultList[0];
				console.log(resultVO);
				SBUxMethod.set("srch-inp-opera1", resultVO.psnOgnzNm);//소유조직명
				SBUxMethod.set("srch-inp-opera2", resultVO.psnOgnzBrno);//소유조직 사업자번호
				SBUxMethod.set("srch-inp-opera3", resultVO.operOgnzNm);//운영조직명
				SBUxMethod.set("srch-inp-opera4", resultVO.operOgnzBrno);//운영조직 사업자번호
				SBUxMethod.set("srch-inp-opera5", resultVO.operOgnzPic);//운영조직 대표자
				SBUxMethod.set("srch-inp-opera6", resultVO.daddr);//운영조직 주소
				SBUxMethod.set("srch-inp-opera7", resultVO.operOgnzDeptCd);//운영조직 조직유형
				SBUxMethod.set("srch-inp-opera13", resultVO.apcBrno);//APC 사업자번호
				SBUxMethod.set("srch-inp-opera14", resultVO.apcAddr);//APC 주소

				SBUxMethod.set("srch-inp-opera11", resultVO.operOgnzTrmtItemCn4);//운영조직 취급 기타품목
				SBUxMethod.set("srch-inp-opera18", resultVO.apcTrmtItemCn4);//  APC 처리 기타품목

				//아이템 코드가 없어서 보류
				//SBUxMethod.set("srch-inp-itemNm1", resultVO.operOgnzTrmtItemCn);//운영조직 취급 대표품목1
				//SBUxMethod.set("srch-inp-itemNm2", resultVO.operOgnzTrmtItemCn2);//운영조직 취급 대표품목2
				//SBUxMethod.set("srch-inp-itemNm3", resultVO.operOgnzTrmtItemCn3);//운영조직 취급 대표품목3
				//SBUxMethod.set("srch-inp-itemNm4", resultVO.apcTrmtItemCn);// APC 처리 대표품목1
				//SBUxMethod.set("srch-inp-itemNm5", resultVO.apcTrmtItemCn2);// APC 처리 대표품목2
				//SBUxMethod.set("srch-inp-itemNm6", resultVO.apcTrmtItemCn3);// APC 처리 대표품목3
	        }
	    }catch (e) {
		   	if (!(e instanceof Error)) {
		   		e = new Error(e);
		   	}
		   	console.error("failed", e.message);
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

		let itemCd1 = SBUxMethod.get("srch-inp-itemCd1");
		let itemCd4 = SBUxMethod.get("srch-inp-itemCd4");
    	if (gfn_isEmpty(itemCd1) && gfn_isEmpty(itemCd4)) {
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
         	operOgnzTrmtItemCn : SBUxMethod.get("srch-inp-itemNm1") , //운영조직 취급 대표품목1
         	operOgnzTrmtItemCn2 : SBUxMethod.get("srch-inp-itemNm2") , //운영조직 취급 대표품목2
         	operOgnzTrmtItemCn3 : SBUxMethod.get("srch-inp-itemNm3") , //운영조직 취급 대표품목3
         	operOgnzTrmtItemCn4 : SBUxMethod.get("srch-inp-opera11") , //운영조직 취급 기타품목
         	operOgnzTrmtItemCd : SBUxMethod.get("srch-inp-itemCd1") , //운영조직 취급 대표품목1
         	operOgnzTrmtItemCd2 : SBUxMethod.get("srch-inp-itemCd2") , //운영조직 취급 대표품목2
         	operOgnzTrmtItemCd3 : SBUxMethod.get("srch-inp-itemCd3") , //운영조직 취급 대표품목3
         	apcBrno : SBUxMethod.get("srch-inp-opera13") ,  //APC 사업자번호
         	apcAddr : SBUxMethod.get("srch-inp-opera14") ,	//APC 주소
         	apcTrmtItemCn : SBUxMethod.get("srch-inp-itemNm4") , // APC 처리 대표품목1
         	apcTrmtItemCn2 : SBUxMethod.get("srch-inp-itemNm5") , // APC 처리 대표품목2
         	apcTrmtItemCn3 : SBUxMethod.get("srch-inp-itemNm6") , // APC 처리 대표품목3
         	apcTrmtItemCn4 : SBUxMethod.get("srch-inp-opera18") , //  APC 처리 기타품목
         	apcTrmtItemCd : SBUxMethod.get("srch-inp-itemCd4") , // APC 처리 대표품목1
         	apcTrmtItemCd2 : SBUxMethod.get("srch-inp-itemCd5") , // APC 처리 대표품목2
         	apcTrmtItemCd3 : SBUxMethod.get("srch-inp-itemCd6")  // APC 처리 대표품목3
 		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		selectFcltOperInfo();
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

	// 품목 선택 팝업 호출
	const fn_modalItemSelect = function(sn) {
		popItemSelect.init(sn,fn_setItem);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setItem = function(itemVal) {
		if (!gfn_isEmpty(itemVal)) {
			SBUxMethod.set('srch-inp-itemCd' + itemVal.sn , itemVal.itemCd);
			SBUxMethod.set('srch-inp-itemNm' + itemVal.sn , itemVal.itemNm);
		}
	}

</script>
</html>