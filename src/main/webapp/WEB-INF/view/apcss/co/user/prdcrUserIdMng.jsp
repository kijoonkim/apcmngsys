<%
/**
 * @Class Name : prdcrUserIdMng.jsp
 * @Description : 생산농가 계정관리 화면
 * @author SI개발부
 * @since 2024.05.27
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2024.05.27   	박승진			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 생산농가 계정관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<style>
	.col-md-1.justify-content-center {
	    justify-content: center;
	    display: flex;
	    align-items: center;
	    flex-direction: column;
	    height: 85vh;
	}


	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 공통코드관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_callComUserPrdcrAprvList"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">

				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelectAll.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">생산자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
   								></sbux-input>
 							<th scope="row" class="th_bg">사용자명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-userNm"
									name="srch-inp-userNm"
									class="form-control input-sm"
   								></sbux-input>
   							<th scope="row" class="th_bg">사용자ID</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-userId"
									name="srch-inp-userId"
									class="form-control input-sm"
   								></sbux-input>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-md-5">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li>
									<span>생산농가</span>

								</li>
							</ul>
						</div>
						<div>
							<div id="sb-area-comUserPrdcrAprv" style="height:540px; width:100%;"></div>
						</div>
					</div>
					<div class="col-md-1 justify-content-center">
							<sbux-button id="btn_add_req" type = "button" button-size="large" class="btn btn-sm" text="⬅️" onclick="fn_aprvYupdate"> </sbux-button>
							<sbux-button id="btn_del_prdcr" type = "button" button-size="large" class="btn btn-sm" text="➡️" onclick="fn_aprvNupdate"> </sbux-button>
					</div>
					<div class="col-md-6">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li><span>요청목록</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-comUserPrdcrNotAprv" style="height:540px; width:100%;"></div>
						</div>
					</div>
				</div>
            </div>
        </div>
	</div>
</section>
</body>
<!-- inline scripts related to this page -->
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {

	}

	async function cfn_del() {
	}
	async function cfn_save() {
	}
	async function cfn_search() {
	}



    // only document
    window.addEventListener('DOMContentLoaded', async function(e) {

    	fn_init();

    });

    const fn_init = async function() {
    	// 그리드 생성
    	fn_createComUserPrdcrAprv();
    	fn_createComUserPrdcrNotAprv();
    	fn_callComUserPrdcrAprvList();
    }

	// 요청목록
    var jsonComUserPrdcrNotAprv = [];
    var grdComUserPrdcrNotAprv;
 	// 생산농가
    var jsonComUserPrdcrAprv = [];
    var grdComUserPrdcrAprv;

    // 생산농가 그리드 생성
    function fn_createComUserPrdcrAprv() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-comUserPrdcrAprv';
	    SBGridProperties.id = 'grdComUserPrdcrAprv';
	    SBGridProperties.jsonref = 'jsonComUserPrdcrAprv';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.frozencols = 1;
	    SBGridProperties.clickeventarea = {fixed: false, empty: false};
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.allowcopy = true;
	    //SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
        	{caption: [""],		ref: 'chk',	type: 'radio',		width: '50px',	style: 'text-align:center', typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["코드"],		ref: 'prdcrCd',	type: 'output',		width: '100px',	style: 'text-align:center'},
            {caption: ["생산자명"],		ref: 'prdcrNm',	type: 'output',		width: '100px',	style: 'text-align:center'},
            {caption: ["전화번호"],	ref: 'telno',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["사용자ID"],	ref: 'userId',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["사용자명"],	ref: 'userNm',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["apc코드"],	ref: 'apcCd',     		type:'input',  	hidden: true},
            {caption: ["경영체등록번호"],	ref: 'mngmstRegno',     		type:'input',  	hidden: true}
        ];
        grdComUserPrdcrAprv = _SBGrid.create(SBGridProperties);
    }


	// 요청목록
    function fn_createComUserPrdcrNotAprv() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-comUserPrdcrNotAprv';
	    SBGridProperties.id = 'grdComUserPrdcrNotAprv';
	    SBGridProperties.jsonref = 'jsonComUserPrdcrNotAprv';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.frozencols = 1;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.entertotab = true;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
        	{caption: [""],		ref: 'chk',	type: 'radio',		width: '50px',	style: 'text-align:center', typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
        	{caption: ["ID"],		ref: 'userId',	type: 'output',		width: '100px',	style: 'text-align:center'},
            {caption: ["사용자명"],		ref: 'userNm',	type: 'output',		width: '100px',	style: 'text-align:center'},
            {caption: ["메일주소"],		ref: 'eml',	type: 'output',		width: '100px',	style: 'text-align:center'},
            {caption: ["전화번호"],	ref: 'telno',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["비고"],	ref: 'rmrk',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true},
            {caption: ["apc코드"],	ref: 'apcCd',     		type:'input',  	hidden: true},
        ];
	    grdComUserPrdcrNotAprv = _SBGrid.create(SBGridProperties);
    }



 	// 생산농가에서 승인해제
    async function fn_callComUserPrdcrAprvList(){
    	let apcCd = SBUxMethod.get("gsb-slt-apcCd")
    	let prdcrNm = SBUxMethod.get("srch-inp-prdcrNm")
    	let userNm = SBUxMethod.get("srch-inp-userNm")
    	let userId = SBUxMethod.get("srch-inp-userId")


    	const postJsonPromise = gfn_postJSON("/co/user/selectComUserPrdcrAprvList.do", {
	  		apcCd : gv_selectedApcCd ,
	  		prdcrNm : prdcrNm,
	  		userNm  : userNm,
	  		userId    : userId
  		});

        const data = await postJsonPromise;

        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	      		let totalRecordCount = 0;
  	      		jsonComUserPrdcrAprv.length = 0;
  	      		jsonComUserPrdcrNotAprv.length = 0;

  	          	data.resultList.forEach((item, index) => {
  	          		if(item.TYPE === "PRDCR_LIST"){
  	          			//요청목록 그리드 데이터 추가
	  	          		const arr = {
								prdcrCd : item.PRDCR_CD,
								prdcrNm : item.PRDCR_NM,
								telno : item.TELNO,
								userId : item.USER_ID,
								apcCd : item.APC_CD,
								rmrk : item.RMRK,
								userNm : item.USER_NM
		  				}
	  					jsonComUserPrdcrAprv.push(arr);
  	          		}else if(item.TYPE === "APRV_LIST"){
  	          		//생산농가 그리드 데이터 추가
  	          			const arr = {
  							prdcrCd : item.PRDCR_CD,
  							prdcrNm : item.PRDCR_NM,
  							telno : item.TELNO,
  							userId : item.USER_ID,
  							apcCd : item.APC_CD,
  							eml : item.EML,
  							rmrk : item.RMRK,
  							userNm : item.USER_NM
	  	  				}
  	  					jsonComUserPrdcrNotAprv.push(arr);
  	          		}

  	  			});




  	          	grdComUserPrdcrAprv.rebuild();
  	          	grdComUserPrdcrNotAprv.rebuild();

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }













    // 요청목록에서 승인
    const fn_aprvYupdate = async function() {

    	const comUserAprv = grdComUserPrdcrNotAprv.getRowData(grdComUserPrdcrNotAprv.getRow());

    	const param = {
    			apcCd : comUserAprv.apcCd ,
    			userId : comUserAprv.userId,
    			aprvYn : "Y"
    	}



        if (gfn_comConfirm("Q0001", "저장")) {
        	const postJsonPromise = gfn_postJSON("/co/user/saveComUserAprv.do", param);	// 프로그램id 추가
			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_callComUserPrdcrAprvList();

	        	} else {
		        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
        }
    }

    const fn_aprvNupdate = async function() {

    	const comUserAprv = grdComUserPrdcrAprv.getRowData(grdComUserPrdcrAprv.getRow());
		if(comUserAprv.userId === undefined){
			return;
		}
    	const param = {
    			apcCd : comUserAprv.apcCd ,
    			userId : comUserAprv.userId,
    			aprvYn : "N"
    	}



        if (gfn_comConfirm("Q0001", "저장")) {
        	const postJsonPromise = gfn_postJSON("/co/user/saveComUserAprv.do", param);	// 프로그램id 추가
			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_callComUserPrdcrAprvList();

	        	} else {
		        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
        }
    }










</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>