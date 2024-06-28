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
					<div class="col-md-6">
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
					<div class="col-md-6">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li><span>요청목록</span></li>
							</ul>
								<div class="ad_tbl_toplist">
											<td class="td_input" style="border-right:hidden; border-left: hidden;">
												<sbux-button
													id="btnUserAdd"
													name="btnUserAdd"
													uitype="normal"
													text="요청추가"
													class="btn btn-sm btn-outline-danger"
													onclick="fn_userAdd()"
												></sbux-button>
												<sbux-button
													id="btnUserDel"
													name="btnUserDel"
													uitype="normal"
													text="선택삭제"
													class="btn btn-sm btn-outline-danger"
													onclick="fn_userDel()"
												></sbux-button>
								</div>
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

<!-- 생산자 팝업 -->
	<div>
        <sbux-modal
        	id="modal-apcUserInfo"
        	name="modal-apcUserInfo"
        	uitype="middle"
        	header-title="사용자선택"
        	body-html-id="body-modal-apcUserInfo"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-apcUserInfo">
    	<jsp:include page="../../am/popup/apcUserInfoPopup.jsp"></jsp:include>
    </div>
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
            {caption: ["생산자명"],		ref: 'prdcrNm',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["전화번호"],	ref: 'telno',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["사용자ID"],	ref: 'userId',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["사용자명"],	ref: 'userNm',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption : [''],			ref : 'btnN',		width : '50px',		style : 'text-align:center',	type : 'button' , 		typeinfo : {buttonvalue: '해제', callback: fn_aprvNupdate}
	            , renderer : function(objGrid,nRow,nCol,strValue,objRowData){
	    			if(objRowData.userId === undefined){
	    				return "";
	    			}else{
	    				return "<button type='button' class='btn btn-xs btn-outline-danger' onclick='fn_aprvNupdate()'>해제</button>";
	    			}
	            }
    		},

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
        	//{caption: [""],		ref: 'chk',	type: 'radio',		width: '50px',	style: 'text-align:center', typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
        	{caption : [''],			ref : 'btnY',		width : '50px',		style : 'text-align:center',	type : 'button' , 		typeinfo : {buttonvalue: '승인', callback: fn_aprvYupdate}},
        	{caption: ["ID"],		ref: 'userId',	type: 'output',		width: '100px',	style: 'text-align:center'},
            {caption: ["사용자명"],		ref: 'userNm',	type: 'output',		width: '100px',	style: 'text-align:center'},
            //{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	width: '100px',	style: 'text-align:center'},
            //{caption: ["APC"],	ref: 'apcCd',     		type:'combo',type : 'combo', width: '200px',	style: 'text-align:center', typeinfo :{ ref : 'cjsonApcList', displayui : true, label : 'apcNm', value : 'apcCd'} },
            {caption: ["APC명"],	ref: 'apcNm',     		type:'output', width: '200px',	style: 'text-align:center'},
            {caption: ["메일주소"],		ref: 'eml',	type: 'output',		width: '100px',	style: 'text-align:center'},
            {caption: ["전화번호"],	ref: 'telno',	type: 'output',		width: '150px',	style: 'text-align:center'},
            {caption: ["비고"],	ref: 'rmrk',	type: 'output',		width: '400px',	style: 'text-align:center'},
            {caption: ["apc코드"],	ref: 'apcCd',     		type:'input',  	hidden: true}


        ];
	    grdComUserPrdcrNotAprv = _SBGrid.create(SBGridProperties);
	    grdComUserPrdcrNotAprv.bind('click',fn_apcUserInfoPopup);
    }



 	// 생산농가 조회
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
  							userNm : item.USER_NM,
  							apcNm : item.APC_NM
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

    	let comUserNotAprv = grdComUserPrdcrNotAprv.getRowData(grdComUserPrdcrNotAprv.getRow());
    	let comUserAprv = grdComUserPrdcrAprv.getRowData(grdComUserPrdcrAprv.getRow());
		let rowStatus =  grdComUserPrdcrNotAprv.getRowStatus(grdComUserPrdcrNotAprv.getRow());

		if(comUserAprv === undefined){
			gfn_comAlert("W0003","저장");
			return;
		}

    	var prdcrCd = comUserAprv.prdcrCd;
    	var prdcrNm = comUserAprv.prdcrNm;
    	var userId = comUserNotAprv.userId;
    	var userNm = comUserNotAprv.userNm;
    	var notAprvApcCd = comUserNotAprv.apcCd;
    	var aprvApcCd = comUserAprv.apcCd;

    	if(userId === ""){
    		gfn_comAlert("W0005","ID");
    		return;
    	}

    	//if(notAprvApcCd !== aprvApcCd){
    	//	gfn_comAlert("W0006","생산자APC","계정APC");
    	//	return;
    	//}


   		const param = {
    			apcCd : comUserNotAprv.apcCd
    			, userId : userId
    			, aprvYn : "Y"
    			, prdcrCd : comUserAprv.prdcrCd
    			, rowStatus : rowStatus
    	}

   		if(!confirm("요청목록 계정 : "+userId + "\n 생산자 : "+prdcrCd + "," +  prdcrNm + "\n 승인하시겠습니까?")){
   			return;
 		}



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

    const fn_aprvNupdate = async function() {
    	let rowIndex = grdComUserPrdcrAprv.getRow();
    	let comUserAprv = grdComUserPrdcrAprv.getRowData(rowIndex);

		if(comUserAprv.userId === undefined){
			gfn_comAlert("W0003","해제");
			return;
		}
    	const param = {
    			apcCd : comUserAprv.apcCd ,
    			userId : comUserAprv.userId,
    			aprvYn : "N",
    			rowStatus : 2
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

    const fn_userAdd = function(){
    	grdComUserPrdcrNotAprv.addRow();
    }

    const fn_userDel = async function(){
    	let rowIndex = grdComUserPrdcrNotAprv.getRow();
    	let rowData = grdComUserPrdcrNotAprv.getRowData(rowIndex);
    	let rowStatus =  grdComUserPrdcrNotAprv.getRowStatus(rowIndex);

    	const param = {
    			apcCd : rowData.apcCd ,
    			userId : rowData.userId,
    			prdcrCd : rowData.prdcrCd
    	}

    	if (gfn_comConfirm("Q0001", "삭제")) {
        	const postJsonPromise = gfn_postJSON("/co/user/delComUserAprv.do", param);	// 프로그램id 추가
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
	        finally{
	        	grdComUserPrdcrNotAprv.deleteRow(rowIndex);
	        }
        }
    }

    /** 사용자정보 팝업함수 **/
    const fn_apcUserInfoPopup = function(){
    	let colIndex = grdComUserPrdcrNotAprv.getColRef("userId");
   	 	let rowIndex = grdComUserPrdcrNotAprv.getRow();
   	 	let cellData = grdComUserPrdcrNotAprv.getCellData(rowIndex, colIndex);
	   	 if(cellData === ""){
	   		 SBUxMethod.openModal('modal-apcUserInfo');
	   		 popApcUserInfo.init(fn_setApcUserInfo);
	   	 }
    }

    const fn_setApcUserInfo = function(data){
   	 	let rowIndex = grdComUserPrdcrNotAprv.getRow();

   	 	var objRowData =	{
   				apcCd	:	data.apcCd,
   				userNm	:	data.userNm,
   				userId    :  data.userId,
   				apcNm  : data.apcNm
   			};

   	 	grdComUserPrdcrNotAprv.setRowData(rowIndex, objRowData, true);
    }








</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>