<%
 /**
  * @Class Name : fcltOperHfInfoReg.jsp
  * @Description : 3.6.고용인력 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 시설고용인력 -->
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
			<div><label>시설고용 상세내역</label></div>
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
						<th></th>
						<th class="th_bg" class="th_bg">내국인(명)</th>
						<th class="th_bg" class="th_bg">외국인(명)</th>
					</tr>
					<tr>
						<td>정규직</td>
						<td class="td_input">
							<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="10" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="1" ></sbux-input>
						</td>
					</tr>
					<tr>
						<td>일용직(연간평균)</td>
						<td class="td_input">
							<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="5" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="10" ></sbux-input>
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
		fn_selectGrdHireInfoList();
	});
    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_selectGrdHireInfoList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdHireInfoList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperHfInfoList.do", {
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
        		SBUxMethod.set('srch-inp-opera1',item.hireNope);
        		SBUxMethod.set('srch-inp-opera2',item.hireNope2);
        		SBUxMethod.set('srch-inp-opera3',item.hireNope3);
        		SBUxMethod.set('srch-inp-opera4',item.hireNope4);
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

    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperHfInfo.do", {
    			trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    			,apcCd : SBUxMethod.get('srch-inp-apcCd')
    			,hireNope : SBUxMethod.get('srch-inp-opera1')
    			,hireNope2 : SBUxMethod.get('srch-inp-opera2')
    			,hireNope3 : SBUxMethod.get('srch-inp-opera3')
    			,hireNope4 : SBUxMethod.get('srch-inp-opera4')

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