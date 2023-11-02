<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>

	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- APC관리자승인등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="승인" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>

			</div>
			<div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
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
							<th scope="row">승인여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-userStts"
									name="srch-slt-userStts"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonComUserStts"
									unselected-text="선택"
									readonly
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-userNm"
									name="srch-inp-userNm"
									uitype="text"
									class="form-control input-sm" 
									placeholder="" 
									title=""
									maxlength="13"
								></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
					</tbody>
				</table>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>승인요청목록</span>
								<span style="font-size:12px">(조회건수 <span id="cnt-userAprv">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdUserAprv" style="height:500px; margin-top:8px;"></div>
				</div>
			</div>
	</section>
</body>

<script type="text/javascript">

	const lv_paging = {
		'type' : 'page',
	  	'count' : 5,
	  	'size' : 20,
	  	'sorttype' : 'page',
	  	'showgoalpageui' : true
    };

	var jsonComUserStts	= [];	// 사용자상태	USER_STTS	srch-slt-userStts

	var grdUserAprv;
	var jsonUserAprv = [];

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		await gfn_setComCdSBSelect('srch-slt-userStts', jsonComUserStts, 'USER_STTS');
		SBUxMethod.set("srch-slt-userStts", "00");

		fn_createGridUserAprv();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGridUserAprv();
		fn_init();
		fn_search();
	});

	const fn_createGridUserAprv = function() {
		var SBGridProperties = {};

	    SBGridProperties.parentid = 'sb-area-grdUserAprv';
	    SBGridProperties.id = 'grdUserAprv';
	    SBGridProperties.jsonref = 'jsonUserAprv';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = lv_paging,
		SBGridProperties.columns = [
	        {caption: ["선택"],		ref: 'checkedYn',	type:'checkbox', width:'5px',
	        	typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
	        },
	        {caption: ["상태"], 		ref: 'userSttsNm',	type:'output',  width:'15%', style:'text-align:center'},
	        {caption: ["사용자ID"],  	ref: 'userId',    	type:'output',	width:'15%', style:'text-align:center'},
	        {caption: ["사용자명"],   	ref: 'userNm',      type:'output',  width:'15%', style:'text-align:center'},
	        {caption: ["APC명"],		ref: 'apcNm',   	type:'output',  width:'15%', style:'text-align:center'},
	        {caption: ["사용자유형"],	ref: 'userTypeNm',	type:'output',  width:'15%', style:'text-align:center'},
	        {caption: ["메일주소"],  	ref: 'eml',  		type:'output',  width:'15%', style:'text-align:center'},
	    	{caption: ["전화번호"],  	ref: 'telno',   	type:'output',  width:'15%', style:'text-align:center'},
	        {caption: ["직책명"],  	ref: 'jbttlNm',   	type:'output',  width:'15%', style:'text-align:center'},
	        {caption: ["담당업무"],  	ref: 'tkcgTaskNm',  type:'output',  width:'15%', style:'text-align:center'},
			{caption: ["사용자상태"],	ref: 'userStts',  	type:'output',  hidden: true},
			{caption: ["사용자유형"],	ref: 'userType',  	type:'output',  hidden: true},
			{caption: ["apc코드"],	ref: 'apcCd',  		type:'output',  hidden: true}
		];
	    grdUserAprv = _SBGrid.create(SBGridProperties);
	}

	const fn_search = async function() {

		grdUserAprv.rebuild();

		// set pagination
    	let pageSize = grdUserAprv.getPageSize();
    	let pageNo = 1;

    	fn_setGrdUserAprv(pageSize, pageNo);
	}

    /**
     * @name fn_setGrdUserAprv
     * @description 사용자승인목록 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdUserAprv = async function(pageSize, pageNo) {

        let userStts = SBUxMethod.get("srch-slt-userStts");	//	사용자상태
        let userNm = SBUxMethod.get("srch-inp-userNm");     // 	사용자명

		const postJsonPromise = gfn_postJSON("/co/user/selectUserAprvList.do", {
			apcCd: gv_selectedApcCd,
			userStts: userStts,
			userNm: userNm,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonUserAprv.length = 0;
          	data.resultList.forEach((item, index) => {
          		const userAprv = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						userId: item.userId,
  						userNm: item.userNm,
  						apcNm: item.apcNm,
  						userStts: item.userStts,
  						userSttsNm: item.userSttsNm,
  						userType: item.userType,
  						userTypeNm: item.userTypeNm,
  						eml: item.eml,
  						telno: item.telno,
  						jbttlNm: item.jbttlNm,
  						tkcgTaskNm: item.tkcgTaskNm,
  				}
          		jsonUserAprv.push(userAprv);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

			grdUserAprv.refresh();
          	document.querySelector('#cnt-userAprv').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

	const fn_save = async function() {

		const userAprvList = [];
		const allUserData = grdUserAprv.getGridDataAll();

		allUserData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				userAprvList.push({
    				userId: item.userId
    			});
    		}
		});

		if (userAprvList.length == 0) {
			gfn_comAlert("W0001", "승인대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (!gfn_comConfirm("Q0001", "승인")) {
			return;
		}

    	const postJsonPromise = gfn_postJSON("/co/user/insertUserAprvList.do", userAprvList);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_search();
	}

</script>

</html>