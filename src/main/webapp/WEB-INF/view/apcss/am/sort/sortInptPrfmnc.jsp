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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 선별실적조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSort" name="btnDocSort" uitype="normal" text="선별확인서" class="btn btn-sm btn-success"></sbux-button>
					<sbux-button id="btnSearch" name="btnDocSort" uitype="normal" text="조회" class="btn btn-sm btn-outline-dark"></sbux-button>
				</div>
			</div>
			<div class="box-body">
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
						<th scope="row">APC명</th>
						<td colspan="3" class="td_input" style="border-right: hidden;">
					    	<div class="form-group">
								<sbux-input id="srch-inp-apcCd" name="input_text" uitype="text" class="form-control" placeholder="" disabled=""></sbux-input>
							</div>
						</td>
					</tr>
						<tr>
							<th scope="row">선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-sortYmd" name="srch-inp-sortYmd" uitype="popup"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-endSortYmd" name="srch-inp-endSortYmd" uitype="popup"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row">품목</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control input-sm"></sbux-select> 
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-item" name="srch-btn-item" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="select_single" name="select_single" uitype="single" class="form-control input-sm">
									<option-item>멀티선택</option-item>
									<td class="td_input" style="border-right: hidden;">
										<sbux-button id="srch-btn-vrty" name="srch-btn-vrty" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
									</td>
								</sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">선별기</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-sort" name="srch-slt-sort" uitype="single" class="form-control input-sm"></sbux-select>       
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-strgWarehouse" name="srch-slt-strgWarehouse" uitype="single" class="form-control input-sm"></sbux-select>  
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" uitype="single" class="form-control input-sm"></sbux-select>  
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">대표생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<td class="td_input" style="border-right: hidden;">
										<sbux-button id="srch-btn-rprsPrdcr" name="srch-btn-rprsPrdcr" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
									</td>
								</select>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>선별 내역</span></li>
							<li><label style="font-size:x-small;">지시중량 : 99.999Kg &nbsp; 실적중량 : 99.999Kg</label></li>
						</ul>
					</div>
					<div id="sb-area-grdSortDsctn" style="height:340px;"></div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<script type="text/javascript">
	
	// ${comMenuVO.menuId}
	
	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	fn_createSortDsctnGrid();

    	gfn_setComCdSBSelect(
    			['srch-select-msgKnd', 'dtl-select-msgKnd'],
    			jsonComMsgKnd,
			'MSG_KND');
    });
    
    //grid 초기화
    var grdComMsgList; // 그리드를 담기위한 객체 선언
    var jsonComMsgList = []; // 그리드의 참조 데이터 주소 선언
    
    function fn_createSortDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortDsctn';
	    SBGridProperties.id = 'grdComMsgList';
	    SBGridProperties.jsonref = 'jsonComMsgList1';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
            {caption: ["선별일자","선별일자"],		ref: 'msgKey',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["설비명","설비명"], 			ref: 'msgCn',     	type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["입고구분","입고구분"], 	 	ref: 'msgKndNm',    type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["상품구분","상품구분"],    	ref: 'rmrk',        type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["운송구분","운송구분"],	    ref: 'creUserId',   type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["품종","품종"],	    		ref: 'creDateTime', type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["규격","규격"],  			ref: 'updUserId',   type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["투입","수량"],  			ref: 'updUserId',   type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["투입","중량"],  			ref: 'updUserId',   type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["등급","등급"],  			ref: 'updDateTime', type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["선별","수량"],  			ref: 'updDateTime', type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["선별","중량"],  			ref: 'updDateTime', type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["LOSS","LOSS"], 			ref: 'creProgram',  type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["대표생산자","대표생산자"], 	ref: 'creProgram',  type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["투입창고","투입창고"], 		ref: 'creProgram',  type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["저장창고","저장창고"], 		ref: 'creProgram',  type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["비고","비고"], 			ref: 'creProgram',  type:'output',  width:'7%',    style:'text-align:center'}
        ];
        
        grdComMsgList = _SBGrid.create(SBGridProperties);
        grdComMsgList.bind('click', 'fn_view');
        grdComMsgList.bind('beforepagechanged', 'fn_pagingComMsgList');
    }
    
    
    /**
     * 목록 조회
     */
    const fn_search = async function() {
        
    	// set pagination
    	let pageSize = grdComMsgList.getPageSize();
    	let pageNo = 1;
        
    	fn_setGrdComMsgList(pageSize, pageNo);
    }

    /**
     * 
     */
    const fn_pagingComMsgList = async function() {
    	let recordCountPerPage = grdComMsgList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdComMsgList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdComMsgList(recordCountPerPage, currentPageNo);
    }
    
    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdComMsgList = async function(pageSize, pageNo) {
    	
    	// form clear 
    	fn_clearForm();
    	
		grdComMsgList.clearStatus();

		let msgKnd = SBUxMethod.get("srch-select-msgKnd");
		let msgKey = SBUxMethod.get("srch-input-msgKey");
		let msgCn = SBUxMethod.get("srch-input-msgCn");
		
        const postJsonPromise = gfn_postJSON("/co/msg/selectComMsgList.do", {
        	msgKnd: msgKnd,
        	msgKey: msgKey,
        	msgCn: msgCn,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
		});
        
        const data = await postJsonPromise;
        
        try {
        	
        	/** @type {number} **/
    		let totalRecordCount = 0;
        	
        	jsonComMsgList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					msgKey: item.msgKey,
					msgCn: item.msgCn,
					msgKnd: item.msgKnd,
					msgKndNm: item.msgKndNm,
					rmrk: item.rmrk,
					sysFrstInptDt: item.sysFrstInptDt,
					sysFrstInptUserId: item.sysFrstInptUserId,
					sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,
					sysLastChgDt: item.sysLastChgDt,
					sysLastChgUserId: item.sysLastChgUserId,
					sysLastChgPrgrmId: item.sysLastChgPrgrmId					
				}
				jsonComMsgList.push(msg);
				
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;	
				}
			});
        	
        	console.log("totalRecordCount", totalRecordCount);
        	
        	if (jsonComMsgList.length > 0) {
        		
        		if(grdComMsgList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdComMsgList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdComMsgList.rebuild();
				}else{
					grdComMsgList.refresh()
				}
        	} else {
        		grdComMsgList.setPageTotalCount(totalRecordCount);
        		grdComMsgList.rebuild();
        	}
        	
        	document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    } 
    
    
    //신규 작성
    function fn_create() {    	
    	SBUxMethod.set("dtl-select-msgKnd", null);
        SBUxMethod.set("dtl-input-msgKey", null);
        SBUxMethod.attr("dtl-input-msgKey", "readonly", false);
        SBUxMethod.set("dtl-input-msgCn", null);
        SBUxMethod.set("dtl-input-rmrk", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }
    
    const fn_clearForm = function() {
    	SBUxMethod.set("dtl-select-msgKnd", null);
        SBUxMethod.set("dtl-input-msgKey", null);
        SBUxMethod.attr("dtl-input-msgKey", "readonly", true);
        SBUxMethod.set("dtl-input-msgCn", null);
        SBUxMethod.set("dtl-input-rmrk", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }
        
    //저장
    const fn_save = async function() {
    	
    	let msgKey = SBUxMethod.get("dtl-input-orgnMsgKey");
    	
    	if (!SBUxMethod.get("dtl-select-msgKnd")) {
            alert("메시지종류를 선택하세요.");
            return;
        }
    	
    	if (!SBUxMethod.get("dtl-input-msgKey")) {
            alert("메시지Key를 입력하세요.");
            return;
        }
    	
    	if (!SBUxMethod.get("dtl-input-msgCn")) {
            alert("메시지내용을 입력하세요.");
            return;
        }
    	
    	/*
        SBUxMethod.set("dtl-input-orgnMsgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgKnd", rowData.msgKnd);
        SBUxMethod.set("dtl-input-msgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgCn", rowData.msgCn);
        SBUxMethod.set("dtl-input-rmrk", rowData.rmrk);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-input-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-input-sysLastChgDt", rowData.sysLastChgDt);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
    	 */
    	if (gfn_isEmpty(msgKey)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (isConfirmed){
    	
    	 if (!isConfirmed) return;
    	
    	const postJsonPromise = gfn_postJSON("/co/msg/insertComMsg.do", {
			msgKey: SBUxMethod.get('dtl-input-msgKey'),
			msgKnd: SBUxMethod.get('dtl-select-msgKnd'),
			msgCn: SBUxMethod.get('dtl-input-msgCn'),
			rmrk: SBUxMethod.get('dtl-input-rmrk')    	        	
		});
        
        const data = await postJsonPromise;
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {        	
        }
        
        // 결과 확인 후 재조회
        console.log("insert result", data);
    }
     
	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){
    	
		if (!isConfirmed) return;
    	
    	const postJsonPromise = gfn_postJSON("/co/msg/updateComMsg.do", {
			msgKey: SBUxMethod.get('dtl-input-orgnMsgKey'),
			msgKnd: SBUxMethod.get('dtl-select-msgKnd'),
			msgCn: SBUxMethod.get('dtl-input-msgCn'),
			rmrk: SBUxMethod.get('dtl-input-rmrk')
		});
        
        const data = await postJsonPromise;
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {        	
        }
        
        // 결과 확인 후 재조회
        console.log("update result", data);
    }

    
    //선택 삭제
    function fn_delete() {
    	
    	/**
         * @type {any[]}
         */
        let list = [];
        
        /**
         * @type {any[]}
         */
        const rows = grdComMsgList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({msgKey: row.msgKey});
        	}
        });
        
        if (list.length == 0) {
        	alert("삭제할 대상이 없습니다.");
        	return;
        }
        
        fn_subDelete(confirm("삭제 하시겠습니까?"), list);
        
        /*
        for ( let i = 0; i < gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].msgKey);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg;
        if (delList.length == 1) {
            delMsg = delList[0];
        }
        else {
            delMsg = delList.length + "건";
        }
        delMsg += "을 삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delKey=" + delList.join(",");
            console.log("data ::::: " + params);
        }
        */
    }
    
	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){
     	
 		if (!isConfirmed) return;
     	
     	const postJsonPromise = gfn_postJSON("/co/msg/deleteComMsgList.do", list);
         
         const data = await postJsonPromise;
         
         try {
         	if (_.isEqual("S", data.resultStatus)) {
         		alert("처리 되었습니다.");
         		fn_search();
         	} else {
         		alert(data.resultMessage);
         	}
         } catch(e) {        	
         }
         
         // 결과 확인 후 재조회
         console.log("update result", data);
    }
    
    //상세정보 보기
    function fn_view() {
        
    	var nCol = grdComMsgList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdComMsgList.getRow();
		if (nRow < 1) {
            return;
		}
		
        let rowData = grdComMsgList.getRowData(nRow);

        SBUxMethod.set("dtl-input-orgnMsgKey", rowData.msgKey);
        SBUxMethod.set("dtl-select-msgKnd", rowData.msgKnd);
        SBUxMethod.set("dtl-input-msgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgCn", rowData.msgCn);
        SBUxMethod.set("dtl-input-rmrk", rowData.rmrk);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-input-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-input-sysLastChgDt", rowData.sysLastChgDt);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
        
    }
    
    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = grdComMsgList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdComMsgList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }
    
    </script>
</body>
</html>