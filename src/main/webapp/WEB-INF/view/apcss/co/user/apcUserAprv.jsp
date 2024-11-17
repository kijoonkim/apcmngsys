<%
/**
 * @Class Name : apcUserAprv.jsp
 * @Description : 법인사용자 APC 승인
 * @author SI개발부
 * @since 2024.08.27
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2024.08.27   	신정철			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html `lang="ko">
<head>
	<title>title : 법인사용자 APC 사용승인</title>
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
						id="btnAprv"
						name="btnAprv"
						uitype="normal"
						text="APC승인"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_insert"
					></sbux-button>
					<sbux-button
						id="btnAprvCncl"
						name="btnAprvCncl"
						uitype="normal"
						text="APC승인취소"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_delete"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">

				<!--[pp] 검색 -->
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
							<th scope="row" class="th_bg">승인여부</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-aprvYn"
									name="srch-slt-aprvYn"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonAprvYn"
									unselected-text="전체"
									onchange="fn_search"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg">사용자명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-userNm"
									name="srch-inp-userNm"
									class="form-control input-sm"
   								></sbux-input>
   							</td>
   							<th scope="row" class="th_bg">사용자ID</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-userId"
									name="srch-inp-userId"
									class="form-control input-sm"
   								></sbux-input>
   							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">법인명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-corpNm"
									name="srch-inp-corpNm"
									class="form-control input-sm"
   								></sbux-input>
							</td>
							<th scope="row" class="th_bg">법인번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-crno"
									name="srch-inp-crno"
									class="form-control input-sm"
   								></sbux-input>
							</td>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-apcNm"
									name="srch-inp-apcNm"
									class="form-control input-sm"
   								></sbux-input>
   							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>APC 사용신청 목록</span>
								<span style="font-size:12px">(조회건수 <span id="cnt-userApc">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdUserApc" style="height:540px; width:100%;"></div>
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
    
    // SBSelect JSON
	var jsonAprvYn	= [
		{'text': '미승인', 'value': 'N'},
		{'text': '승인', 'value': 'Y'},
	];

    // 그리드 객체, json
    var grdUserApc = null;
    var jsonUserApc = [];
    
    /**
     * @name fn_init
     * @description 초기세팅
     * @function
     */
    const fn_init = async function() {
    	// 그리드 생성
    	fn_createSBGrid();
    }

    /**
     * @name fn_createSBGrid
     * @description 그리드생성
     * @function
     */
    const fn_createSBGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdUserApc';
	    SBGridProperties.id = 'grdUserApc';
	    SBGridProperties.jsonref = 'jsonUserApc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.frozencols = 1;
	    //SBGridProperties.clickeventarea = {fixed: false, empty: false};
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.allowcopy = true;
	    //SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
        	{
        		caption: ["체크"], 	
        		ref: 'checkedYn', 	
        		type: 'checkbox',	
        		width:'40px',  
        		style:'text-align: center',
				typeinfo: {
					ignoreupdate : true, 
					fixedcellcheckbox : {usemode : true, rowindex : 0}, 
					checkedvalue : 'Y', 
					uncheckedvalue : 'N'
				}
        	},
            {
            	caption: ["사용자ID"],		
            	ref: 'userId',	
            	type: 'output',		
            	width: '60px',	
            	style: 'text-align:center'
            },
            {
            	caption: ["사용자명"],		
            	ref: 'userNm',	
            	type: 'output',		
            	width: '100px',	
            	style: 'text-align:center'
            },
        	{
            	caption: ["APC명"],		
            	ref: 'apcCd',	
            	type: 'output',		
            	width: '60px',	
            	style: 'text-align:center'
            },
            {
            	caption: ["APC명"],		
            	ref: 'apcNm',	
            	type: 'output',		
            	width: '150px',	
            	style: 'text-align:left'
            },
        	{
        		caption: ["신청 일시"], 		
        		ref: 'aplyDt',	
        		type:'output',  	
        		width:'120px', 
        		style:'text-align:center',
        	},
        	{
        		caption: ["신청 상세"], 		
        		ref: 'aplyRmrk',	
        		type:'output',
        		width:'200px', 
        		style:'text-align:center',
        	},
	        {
        		caption: ["승인"], 		
        		ref: 'aprvYn',	
        		type:'output',  	
        		width:'40px', 
        		style:'text-align:center'
        	},
        	{
        		caption: ["승인 일시"], 		
        		ref: 'aprvDt',	
        		type:'output',  	
        		width:'110px', 
        		style:'text-align:center',
        	},
        	{
        		caption: ["승인 비고"], 		
        		ref: 'aprvRmrk',	
        		type:'input',
        		width:'200px', 
        		style:'text-align:center',
        	},
        ];
        
        grdUserApc = _SBGrid.create(SBGridProperties);
    	document.querySelector('#cnt-userApc').innerText = 0;
    }

    /**
     * @name fn_insert
     * @description 승인등록
     * @function
     */
    const fn_insert = async function() {
		await fn_insertUserApcAprv();
    }    
    
    const fn_insertUserApcAprv = async function() {
    	
		const aplyList = [];
		const allData = grdUserApc.getGridDataAll();
		
		for ( let i=0; i<allData.length; i++) {

			const item = allData[i];
			
			if (_.isEqual("Y", item.checkedYn)) {
				
				if (_.isEqual("Y", item.aprvYn)) {
					gfn_comAlert("W0010", "승인", "APC");	//	W0010	이미 {0}된 {1} 입니다.
					return;
				}
				
				aplyList.push({
					userId: item.userId,
					apcCd: item.apcCd,
					aprvRmrk: item.aprvRmrk
    			});	
    		}
		}

		if (aplyList.length == 0) {
			gfn_comAlert("W0003", "승인");	//	W0003	{0}할 대상이 없습니다.
			return;
		}

		const param = {
			userApcList: aplyList
		}
		
    	const postJsonPromise = gfn_postJSON("/co/user/insertUserApcAprv.do", param);
		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    
    /**
     * @name fn_delete
     * @description 승인취소
     * @function
     */
    const fn_delete = async function() {
		await fn_deleteUserApcAprv();
    }
    
    /**
     * @name fn_deleteUserApcAprv
     * @description 승인취소 처리
     * @function
     */
    const fn_deleteUserApcAprv = async function() {
    	
		const aplyList = [];
		const allData = grdUserApc.getGridDataAll();
		
		for ( let i=0; i<allData.length; i++) {

			const item = allData[i];
			
			if (_.isEqual("Y", item.checkedYn)) {
				
				if (!_.isEqual("Y", item.aprvYn)) {
					gfn_comAlert("W0020", "미승인", "신청");	//	W0020	{0} 상태의 {1} 입니다.
					return;
				}
				
				aplyList.push({
					userId: item.userId,
					apcCd: item.apcCd,
					aprvRmrk: item.aprvRmrk
    			});	
    		}
		}

		if (aplyList.length == 0) {
			gfn_comAlert("W0003", "취소");	//	W0003	{0}할 대상이 없습니다.
			return;
		}

		const param = {
			userApcList: aplyList
		}
		
    	const postJsonPromise = gfn_postJSON("/co/user/deleteUserApcAprv.do", param);
		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    
    /**
     * @name fn_search
     * @description 조회
     * @function
     */
    const fn_search = async function() {
		await fn_setGrdUserApc();
    }    
    
    /**
     * @name fn_setGrdUserApc
     * @description 사용자APC목록 조회
     * @function
     */
    const fn_setGrdUserApc = async function() {
    	
    	jsonUserApc.length = 0;
 		
    	const aprvYn = SBUxMethod.get("srch-slt-aprvYn");
    	const userNm = SBUxMethod.get("srch-inp-userNm");
    	const userId = SBUxMethod.get("srch-inp-userId");
    	const corpNm = SBUxMethod.get("srch-inp-corpNm");
    	const crno = SBUxMethod.get("srch-inp-crno");
    	const apcNm = SBUxMethod.get("srch-inp-apcNm");
    	
    	const postJsonPromise = gfn_postJSON("/co/user/selectUserApcAprvList.do", {
    		aprvYn: aprvYn,
	  		userNm: userNm,
	  		userId: userId,
	  		corpNm: corpNm,
	  		crno: crno,
	  		apcNm: apcNm,
  		});

        const data = await postJsonPromise;

        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		jsonUserApc.push(item);
				});

  	          	let totalRecordCount = jsonUserApc.length;
  	          	grdUserApc.rebuild();
  	          	
  	  			const getColRef = grdUserApc.getColRef("checkedYn");
  				grdUserApc.setFixedcellcheckboxChecked(0, getColRef, false);
  	          	
	        	document.querySelector('#cnt-userApc').innerText = totalRecordCount;
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>