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
	<title>title : 메시지관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 메시지관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCreate" name="btnCreate" uitype="normal"  text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal"  text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal"  text="삭제"  class="btn btn-sm btn-outline-danger"onclick="fn_delete"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal"  text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
							<th scope="row" class="th_bg" >메시지종류</th>
							<td colspan="" class="td_input" style="border-right:hidden;" >
								<sbux-select id="srch-select-msgKnd" name="srch-select-msgKnd" uitype="single"
									jsondata-ref="jsonComMsgKnd"
									unselected-text="선택"
									style="width:120px;"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" >메시지Key</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-input-msgKey" name="srch-input-msgKey" uitype="text"
									style="width:200px"
									placeholder=""
									class="form-control input-sm"
								></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">메시지내용</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-input-msgCn" name="srch-input-msgCn" uitype="text"
									style="width:200px"
									placeholder=""
									class="form-control input-sm"
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-6">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>코드목록</span>
									<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								</li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdComMsg" style="height:616px; width:100%;"></div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>메시지상세정보</span></li>
							</ul>
						</div>
						<div>
							<table class="table table-bordered tbl_fixed">
								<colgroup>
								<col style="width:20%">
								<col style="width:30%">
								<col style="width:20%">
								<col style="width:30%">
								</colgroup>
								<tr>
								    <th scope="row" class="th_bg" >메시지유형</th>
								    <td colspan="3" class="td_input">
								    	<sbux-select id="dtl-select-msgKnd" name="dtl-select-msgKnd" uitype="single"
								    		jsondata-ref="jsonComMsgKnd"
								    		unselected-text="선택"
								    		class="form-control input-sm"
								   		></sbux-select>
								    </td>
								</tr>
								<tr>
								    <th scope="row" class="th_bg" >메시지KEY</th>
								    <td colspan="3" class="td_input">
								        <sbux-input id="dtl-input-msgKey" name="dtl-input-msgKey" class="form-control input-sm" uitype="text" required style="width:100%" readonly ></sbux-input>
								    </td>
								</tr>
								<tr>
								    <th scope="row" class="th_bg" >메시지내용</th>
								    <td colspan="3" class="td_input">
								        <sbux-input id="dtl-input-msgCn" name="dtl-input-msgCn" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
								    </td>
								</tr>
								<tr>
								    <th scope="row" class="th_bg" >비고</th>
								    <td colspan="3" class="td_input">
								    	<sbux-input id="dtl-input-rmrk" name="dtl-input-rmrk" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
								    </td>
								</tr>
								<tr>
								    <th scope="row" class="th_bg" >최초등록자ID</th>
								    <td scope="row" class="th_bg">
								        <sbux-input id="dtl-input-sysFrstInptUserId" name="dtl-input-sysFrstInptUserId" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
								</td>
									<th scope="row" class="th_bg" >최초변경자ID</th>
									<td scope="row" class="th_bg">
										<sbux-input id="dtl-input-sysLastChgUserId" name="dtl-input-sysLastChgUserId" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
								</tr>
								<tr>
								    <th scope="row" class="th_bg" >최초등록일시</th>
								    <td scope="row" class="th_bg">
										<sbux-input id="dtl-input-sysFrstInptDt" name="dtl-input-sysFrstInptDt" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
									<th scope="row" class="th_bg" >최초변경일시</th>
									<td scope="row" class="th_bg">
										<sbux-input id="dtl-input-sysLastChgDt" name="dtl-input-sysLastChgDt" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg" >등록프로그램</th>
									<td scope="row" class="th_bg">
										<sbux-input id="dtl-input-sysFrstInptPrgrmId" name="dtl-input-sysFrstInptPrgrmId" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
									<th scope="row" class="th_bg" >변경프로그램</th>
									<td scope="row" class="th_bg">
										<sbux-input id="dtl-input-sysLastChgPrgrmId" name="dtl-input-sysLastChgPrgrmId" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
										<sbux-input id="dtl-input-delYn" name="dtl-input-delYn" class="form-control input-sm" uitype="hidden" style="width:100%" readonly></sbux-input>
									</td>
								</tr>
							</table>
						</div>
					</div>

                </div>
            </div>
        </div>
	</section>
</body>
<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}

	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_createGrid();

    	gfn_setComCdSBSelect(
    			['srch-select-msgKnd', 'dtl-select-msgKnd'],
    			jsonComMsgKnd,
			'MSG_KND');
    });

    //grid 초기화
    var grdComMsgList; // 그리드를 담기위한 객체 선언
    var jsonComMsgList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdComMsg';
	    SBGridProperties.id = 'grdComMsgList';
	    SBGridProperties.jsonref = 'jsonComMsgList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["메시지Key"],	ref: 'msgKey',      type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["메시지내용"], 	ref: 'msgCn',     	type:'output',  width:'50%',    style:'text-align:left'},
            {caption: ["메시지종류"],  	ref: 'msgKndNm',    type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["비고"],      	ref: 'rmrk',        type:'output',  hidden: true},
            {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
            {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"], ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"], ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"], ref: 'updProgram',  type:'output',  hidden: true}
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
					sysLastChgPrgrmId: item.sysLastChgPrgrmId,
					delYn : item.delYn
				}
				jsonComMsgList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});


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
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }


    //신규 작성
    function fn_create() {
    	SBUxMethod.set("dtl-input-orgnMsgKey", "");
    	SBUxMethod.set("dtl-select-msgKnd", "");
        SBUxMethod.set("dtl-input-msgKey", "");
        SBUxMethod.attr("dtl-input-msgKey", "readonly", false);
        SBUxMethod.set("dtl-input-msgCn", "");
        SBUxMethod.set("dtl-input-rmrk", "");
        SBUxMethod.set("dtl-input-sysFrstInptUserId", "");
        SBUxMethod.set("dtl-input-sysLastChgUserId", "");
        SBUxMethod.set("dtl-input-sysFrstInptDt", "");
        SBUxMethod.set("dtl-input-sysLastChgDt", "");
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", "");
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", "");
        SBUxMethod.set("dtl-input-delYn", "");
    }

    const fn_clearForm = function() {
    	SBUxMethod.set("dtl-input-orgnMsgKey", "");
    	SBUxMethod.set("dtl-select-msgKnd", "");
        SBUxMethod.set("dtl-input-msgKey", "");
        SBUxMethod.attr("dtl-input-msgKey", "readonly", true);
        SBUxMethod.set("dtl-input-msgCn", "");
        SBUxMethod.set("dtl-input-rmrk", "");
        SBUxMethod.set("dtl-input-sysFrstInptUserId", "");
        SBUxMethod.set("dtl-input-sysLastChgUserId", "");
        SBUxMethod.set("dtl-input-sysFrstInptDt", "");
        SBUxMethod.set("dtl-input-sysLastChgDt", "");
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", "");
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", "");
        SBUxMethod.set("dtl-input-delYn", "");
    }

    //저장
    const fn_save = async function() {

    	let msgKey = SBUxMethod.get("dtl-input-orgnMsgKey");
    	let delYn = SBUxMethod.get("dtl-input-delYn");

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

    	if (gfn_isEmpty(delYn)) {
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
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){

		if (!isConfirmed) return;

		var nRow = grdComMsgList.getRow();
 		if (nRow < 1) {
             return;
 		}

        let rowData = grdComMsgList.getRowData(nRow);

		msgVO = {
			msgKey: rowData.msgKey,
			msgKnd: SBUxMethod.get('dtl-select-msgKnd'),
			msgCn: SBUxMethod.get('dtl-input-msgCn'),
			rmrk: SBUxMethod.get('dtl-input-rmrk')
		}

    	const postJsonPromise = gfn_postJSON("/co/msg/updateComMsg.do", msgVO);

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
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
         } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         }
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
        SBUxMethod.set("dtl-input-delYn", rowData.delYn);
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
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>