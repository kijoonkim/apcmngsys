<%
/**
 * @Class Name : comMsgMng.jsp
 * @Description : 메시지관리 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.05.23   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 생산농가 계정등록</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 생산농가 APC등록 -->
				</div>
				<div style="margin-left: auto;">

					<sbux-button id="btnSave" name="btnSave" uitype="normal"  text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal"  text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">


				<div class="row">

						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>신청현황</span>
								</li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdPrdcrUserIdReg" style="height:616px; width:100%;"></div>
						</div>
					</div>



                </div>
            </div>
        </div>
	</section>
	<!-- 생산자 팝업 -->
	<div>
        <sbux-modal
        	id="modal-apcInfo"
        	name="modal-apcInfo"
        	uitype="middle"
        	header-title="APC선택"
        	body-html-id="body-modal-apcInfo"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-apcInfo">
    	<jsp:include page="../../am/popup/apcInfoPopup.jsp"></jsp:include>
    </div>
</body>
<!-- inline scripts related to this page -->
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {

	}
	async function cfn_add() {
		await fn_create();
	}
	async function cfn_del() {
		//await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}
	// ${comMenuVO.menuId}



    // only document
    window.addEventListener('DOMContentLoaded', function(e) {


    	fn_init();

    });


    var jsonApcList= [];
    //grid 초기화
    var grdPrdcrUserIdReg; // 그리드를 담기위한 객체 선언
    var jsonPrdcrUserIdReg = []; // 그리드의 참조 데이터 주소 선언

    const fn_init = async function(){
    	var apcData = await gfn_getApcInfos();

    	apcData.forEach((item, index) => {
				const prdcrUser = {
					label : item.apcNm
					, value : item.apcCd

				}
				jsonApcList.push(prdcrUser);
			});
    	fn_createGrid();
    	fn_search();
    }
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrUserIdReg';
	    SBGridProperties.id = 'grdPrdcrUserIdReg';
	    SBGridProperties.jsonref = 'jsonPrdcrUserIdReg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption : ['APC명'], ref : 'apcCd', width : '200px',	style : 'text-align:center', type : 'combo', typeinfo : {ref:'jsonApcList', label:'label', value:'value', displayui : true}},
            //{caption: ["사용자ID"],		ref: 'userId',      type:'output',  	width:'100px',  style:'text-align:center'},
            {caption: ["생산자명"], 		ref: 'prdcrNm',     	type:'output',  	width:'100px',  style:'text-align:center'},
            {caption: ["사용자명"], 		ref: 'userNm',     	type:'output',  	width:'100px',  style:'text-align:center'},
            {caption: ["승인여부"],  	ref: 'aprvYn',    type:'output',  	width:'50px',   style:'text-align:center'},
            {caption: ["요청일자"],  	ref: 'reqDt',    type:'output',  	width:'100px',   style:'text-align:center'},
            {caption: ["승인일자"],  	ref: 'aprvDt',    type:'output',  	width:'50px',   style:'text-align:center'},
            {caption: ["비고"],      		ref: 'rmrk',        type:'output',  	hidden: true},
            {caption: ["사용자ID"],      		ref: 'userId',        type:'output',  	hidden: true},
            {caption: ["생산자코드"], 	ref: 'prdcrCd',  type:'output',  	hidden: true}
        ];

        grdPrdcrUserIdReg = _SBGrid.create(SBGridProperties);
        grdPrdcrUserIdReg.bind('click',fn_apcInfoPopup);


    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
    	fn_setGrdPrdcrUserId();
    }


    const fn_setGrdPrdcrUserId= async function() {

		const postJsonPromise = gfn_postJSON("/co/user/selectComUserAprvList.do", {
			//apcCd : gv_selectedApcCd
			userId    : '${loginVO.id}'
  		});

  		try {
	        const data = await postJsonPromise;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonPrdcrUserIdReg.length = 0;
          	data.resultList.forEach((item, index) => {
  				const prdcrUser = {
					userId : item.USER_ID
					, prdcrNm : item.PRDCR_NM
					, prdcrCd : item.PRDCR_CD
					, aprvYn  : item.APRV_YN
					, reqDt	 : item.REQ_DT
					, aprvDt  : item.APRV_DT
					, rmrk 	 : item.RMRK
					, apcCd   : item.APC_CD
					, userNm : gv_userNm
  				}
  				jsonPrdcrUserIdReg.push(prdcrUser);
  			});

			if(jsonPrdcrUserIdReg.length ==0){
				grdPrdcrUserIdReg.addRow(true, {'userNm': gv_userNm , 'aprvYn':'N', userId : '${loginVO.id}'});
			}

          	grdPrdcrUserIdReg.rebuild();



		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


    //저장
    const fn_save = async function() {
    	var allData = grdPrdcrUserIdReg.getGridDataAll();
    	var rowData;
    	allData.forEach((item,index) =>{

    		rowData = {
    				prdcrNm : item.prdcrNm
    				,aprvYn :  item.aprvYn
    				,userId : item.userId
    				,apcCd : item.apcCd
    				,reqDt : item.reqDt
    		}
    	});


    	if(rowData.apcCd === ""){
			console.log("apc를 선택해 주세요");
			return;
		}

    	if(rowData.aprvYn === "Y"){
    		console.log("승인된 계정입니다.");
			return;
    	}

    	if(rowData.reqDt === ""){
    		rowData["chk"] = "I";
    	}else{
    		rowData["chk"] = "U"
    	}


   		// 신규 등록
		fn_subInsert(gfn_comConfirm("Q0001", "등록"),rowData);


    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (isConfirmed,rowData){

    	 if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/co/user/savePrdcrUserId.do",rowData);

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }

     /** APC정보 팝업함수 **/
     const fn_apcInfoPopup = function(){
    	 var colIndex = grdPrdcrUserIdReg.getCol();
    	 if(colIndex == 1){
    		 SBUxMethod.openModal('modal-apcInfo');
    		 popApcInfo.init(fn_setApcInfo);
    	 }
     }

     const fn_setApcInfo = function(data){
    	 var rowIndex = grdPrdcrUserIdReg.getRow();
    	 var rowData = grdPrdcrUserIdReg.getRowData(rowIndex);
    	 var objRowData =	{
    				apcCd	:	data.apcCd,
    				prdcrNm	:	rowData.prdcrNm,
    				userNm	:	rowData.userNm,
    				userId    :  rowData.userId,
    				aprvYn   :   rowData.aprvYn,
    				reqDt   :   rowData.reqDt,
    				aprvDt   :   rowData.aprvDt
    			};
    	 grdPrdcrUserIdReg.setRowData(rowIndex, objRowData, true);
     }




</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>