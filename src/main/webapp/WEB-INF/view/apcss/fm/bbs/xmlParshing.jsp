<%
/**
 * @Class Name : xmlParshing.jsp
 * @Description : xmlParshing 화면
 * @author SI개발부
 * @since 2023.12.12
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.12.12 김현호		최초 생성
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
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<div class="sbt-A-wrap">
        <div class="main">
            <!--main content-->
            <div class="content">
                <!--full content-->
                <div class="sbt-wrap-full">
                    <!--Button 영역-->
                    <div class="sbt-search-button" style="text-align:right;">
                        <sbux-button id="btn_create" name="btn_create" uitype="normal" wrap-class="sbt-btn-reset" text="신규" onclick="fn_create"></sbux-button>
                        <sbux-button id="btn_delete" name="btn_delete" uitype="normal" wrap-class="sbt-btn-reset" text="삭제" onclick="fn_delete"></sbux-button>
                        <sbux-button id="btn_save" name="btn_save" uitype="normal" wrap-class="sbt-btn-reset" text="저장" onclick="fn_save"></sbux-button>
                        <sbux-button id="btn_search" name="btn_search" uitype="normal" wrap-class="sbt-btn-search" text="조회" onclick="fn_search"></sbux-button>
                    </div>
                    <!--조회 영역-->
			        <div class="sbt-con-wrap">
                        <form id="frm" name="frm" method="post">
				        <div class="sbt-search-wrap">
                            <div class="sbt-wrap-body-con">
                                <div class="sbt-wrap-body">

                                    <div class="sbt-search-row">
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="srch-label-bbsSeCd" name="srch-label-bbsSeCd" uitype="normal" text="구분"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-select id="srch-select-bbsSeCd" name="srch-select-bbsSeCd" uitype="single"
                                                    jsondata-ref="jsonComBbsSeCd"
                                                    unselected-text="전체"
                                                    style="width:120px;"
                                                ></sbux-select>
                                            </div>
                                            <div class="sbt-col-left">
                                                <sbux-label id="srch-label-bbsTitle" name="srch.label.bbsTitle" uitype="normal" text="내용"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srch-input-bbsTitle" name="srch-input-bbsTitle" uitype="text"
                                                    style="width:400px"
                                                    placeholder=""
                                                ></sbux-input>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="sbt-con-wrap">
                	<ul>
	                    <li style="display:inline-block;float:left;width: 49.5%;vertical-align:top;">
		                    <div class="sbt-grid-wrap">
		                        <div class="sbt-wrap-header">
		                            <span>icon</span>
		                            <h3>게시판목록 <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span></h3>
		                        </div>
		                        <div class="sbt-wrap-body">
		                            <div class="sbt-grid">
		                                <!-- SBGrid를 호출합니다. -->
		                                <div id="sb-area-grdBbs" style="height:550px;"></div>
		                            </div>
		                        </div>
		                    </div>
	                    </li>
	                    <li style="display:inline-block;float:right;width: 49.5%;vertical-align:top;">
		                    <div class="sbt-grid-wrap">
		                        <div class="sbt-wrap-header">
		                            <span>icon</span>
		                            <h3>게시판상세정보2</h3>
		                        </div>
		                        <div class="sbt-wrap-body">
		                            <form id="frm1" name="frm1" method="post">
		                            <sbux-input id="dtl-input-orngBbsNo" name="dtl-input-orngBbsNo" uitype="hidden"></sbux-input>
		                            <table class="tbl">
		                                <colgroup>
		                                    <col style="width:10%">
		                                    <col style="width:15%">
		                                    <col style="width:10%">
		                                    <col style="width:10%">
		                                    <col style="width:10%">
		                                    <col style="width:15%">
		                                    <col style="width:10%">
		                                    <col style="width:20%">
		                                </colgroup>
		                                <tr>
		                                    <th>구분</th>
		                                    <td>
		                                    	<sbux-select id="dtl-select-bbsSeCd" name="dtl-select-bbsSeCd" uitype="single"
		                                    		jsondata-ref="jsonComBbsSeCd"
		                                    		unselected-text="선택"
	                                    		></sbux-select>
		                                    </td>
		                                    <th>등록번호</th>
		                                    <td>
		                                        <sbux-input id="dtl-input-bbsNo" name="dtl-input-bbsNo" uitype="text" required style="width:100%" readonly ></sbux-input>
		                                    </td>
		                                    <th>등록자</th>
		                                    <td>
		                                        <sbux-input id="dtl-input-sysFrstInptUserIdNm" name="dtl-input-sysFrstInptUserIdNm" uitype="text" style="width:100%" readonly></sbux-input>
		                                    </td>
		                                    <th>등록일시</th>
		                                    <td>
		                                      <sbux-input id="dtl-input-sysFrstInptDt" name="dtl-input-sysFrstInptDt" uitype="text" style="width:100%" readonly></sbux-input>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th>제목</th>
		                                    <td colspan="7">
		                                        <sbux-input id="dtl-input-bbsTitle" name="dtl-input-bbsTitle" uitype="text" required style="width:100%"></sbux-input>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th>내용</th>
		                                    <td colspan="7">
		                                        <sbux-textarea  rows="25" cols="120"  id="dtl-input-bbsSubject" name="dtl-input-bbsSubject"  uitype="normal"></sbux-textarea>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th>첨부</th>
		                                    <td colspan="7">
		                                        <sbux-input id="dtl-input-bbsFile" name="dtl-input-bbsFile" uitype="text" required style="width:100%" readonly ></sbux-input>
		                                    </td>
		                                </tr>
		                              </table>
		                            </form>
		                        </div>
		                    </div>
	                    </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}

	// 공통코드 JSON
	var jsonComBbsSeCd = [];	// srch.select.comMsgKnd

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_createGrid();

    	gfn_setComCdSBSelect(
    			['srch-select-bbsSeCd', 'dtl-select-bbsSeCd'],
    			jsonComBbsSeCd,
			'BBS_SE_CD');
    	fn_search();
    });

    //grid 초기화
    var grdBbsList; // 그리드를 담기위한 객체 선언
    var jsonBbsList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdBbs';
	    SBGridProperties.id = 'grdBbsList';
	    SBGridProperties.jsonref = 'jsonBbsList';
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
//             {caption: ["번호"],	ref: 'bbsNo',      type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["유형"],  	ref: 'bbsSeCdNm',    type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["제목"], 	ref: 'bbsTitle',     	type:'output',  width:'60%',    style:'text-align:left'},
            {caption: ["내용"],      	ref: 'bbsSubject',        type:'output',  hidden: true},
            {caption: ["등록자"],	ref: 'sysFrstInptUserIdNm',   type:'output' ,width:'10%'  , style:'text-align:center'},
            {caption: ["등록일"],	ref: 'sysFrstInptDtYmd',   type:'output' ,width:'10%'  , style:'text-align:center'},
            {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
            {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"], ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"], ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"], ref: 'updProgram',  type:'output',  hidden: true}
        ];

        grdBbsList = _SBGrid.create(SBGridProperties);
        grdBbsList.bind('click', 'fn_view');
        grdBbsList.bind('beforepagechanged', 'fn_pagingBbsList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdBbsList.getPageSize();
    	let pageNo = 1;

    	fn_setGrdBbsList(pageSize, pageNo);
    }

    /**
     *
     */
    const fn_pagingBbsList = async function() {
    	let recordCountPerPage = grdBbsList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdBbsList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdBbsList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdBbsList = async function(pageSize, pageNo) {

    	// form clear
    	fn_clearForm();

		grdBbsList.clearStatus();

		let bbsSeCd = SBUxMethod.get("srch-select-bbsSeCd");
		//let bbsNo = SBUxMethod.get("srch-input-bbsNo");
		let bbsTitle = SBUxMethod.get("srch-input-bbsTitle");

       // const postJsonPromise = gfn_postJSON("/co/msg/selectComMsgList.do", {
        const postJsonPromise = gfn_postJSON("/fm/bbs/selectBbsList.do", {
        	bbsSeCd: bbsSeCd,
        	//bbsNo: bbsNo,
        	bbsTitle: bbsTitle,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
		});

        const data = await postJsonPromise;

        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonBbsList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					bbsNo: item.bbsNo,
					bbsTitle: item.bbsTitle,
					bbsSeCd: item.bbsSeCd,
					bbsSeCdNm: item.bbsSeCdNm,
					bbsSubject: item.bbsSubject,
					sysFrstInptDt: item.sysFrstInptDt,
					sysFrstInptDtYmd: item.sysFrstInptDtYmd,
					sysFrstInptUserId: item.sysFrstInptUserId,
					sysFrstInptUserIdNm: item.sysFrstInptUserIdNm,
					sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,
					sysLastChgDt: item.sysLastChgDt,
					sysLastChgUserId: item.sysLastChgUserId,
					sysLastChgUserIdNm: item.sysLastChgUserIdNm,
					sysLastChgPrgrmId: item.sysLastChgPrgrmId
				}
				jsonBbsList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonBbsList.length > 0) {

        		if(grdBbsList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdBbsList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdBbsList.rebuild();
				}else{
					grdBbsList.refresh()
				}
        	} else {
        		grdBbsList.setPageTotalCount(totalRecordCount);
        		grdBbsList.rebuild();
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
    	SBUxMethod.set("dtl-input-orngBbsNo", null);
    	SBUxMethod.set("dtl-select-bbsSeCd", '1');
        SBUxMethod.set("dtl-input-bbsNo", null);
        SBUxMethod.attr("dtl-input-bbsNo", "readonly", true);
        SBUxMethod.set("dtl-input-bbsTitle", null);
        SBUxMethod.set("dtl-input-bbsSubject", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserIdNm", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
    }

    const fn_clearForm = function() {
    	SBUxMethod.set("dtl-input-orngBbsNo", null);
    	SBUxMethod.set("dtl-select-bbsSeCd", null);
        SBUxMethod.set("dtl-input-bbsNo", null);
        SBUxMethod.attr("dtl-input-bbsNo", "readonly", true);
        SBUxMethod.set("dtl-input-bbsTitle", null);
        SBUxMethod.set("dtl-input-bbsSubject", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserIdNm", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
    }

    //저장
    const fn_save = async function() {

    	let bbsNo = SBUxMethod.get("dtl-input-orngBbsNo");

    	if (!SBUxMethod.get("dtl-select-bbsSeCd")) {
            alert("게시판유형을 선택하세요.");
            return;
        }

    	/* if (!SBUxMethod.get("dtl-input-bbsNo")) {
            alert("메시지Key를 입력하세요.");
            return;
        } */

    	if (!SBUxMethod.get("dtl-input-bbsTitle")) {
            alert("제목을 입력하세요.");
            return;
        }

        if (!SBUxMethod.get("dtl-input-bbsSubject")) {
            alert("내용을 입력하세요.");
            return;
        }

    	/*
        SBUxMethod.set("dtl-input-orngBbsNo", rowData.bbsNo);
        SBUxMethod.set("dtl-input-bbsSeCd", rowData.bbsSeCd);
        SBUxMethod.set("dtl-input-bbsNo", rowData.bbsNo);
        SBUxMethod.set("dtl-input-bbsTitle", rowData.bbsTitle);
        SBUxMethod.set("dtl-input-bbsSubject", rowData.bbsSubject);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-input-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-input-sysLastChgDt", rowData.sysLastChgDt);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
    	 */
    	if (gfn_isEmpty(bbsNo)) {
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

    	//const postJsonPromise = gfn_postJSON("/co/msg/insertComMsg.do", {
    	const postJsonPromise = gfn_postJSON("/fm/bbs/insertBbs.do", {
			bbsNo: SBUxMethod.get('dtl-input-bbsNo'),
			bbsSeCd: SBUxMethod.get('dtl-select-bbsSeCd'),
			bbsTitle: SBUxMethod.get('dtl-input-bbsTitle'),
			bbsSubject: SBUxMethod.get('dtl-input-bbsSubject')
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

    	//const postJsonPromise = gfn_postJSON("/co/msg/updateComMsg.do", {
    	const postJsonPromise = gfn_postJSON("/fm/bbs/updateBbs.do", {
			bbsNo: SBUxMethod.get('dtl-input-orngBbsNo'),
			bbsSeCd: SBUxMethod.get('dtl-select-bbsSeCd'),
			bbsTitle: SBUxMethod.get('dtl-input-bbsTitle'),
			bbsSubject: SBUxMethod.get('dtl-input-bbsSubject')
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
        const rows = grdBbsList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({bbsNo: row.bbsNo});
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
                delList.push(gridList[i].bbsNo);
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

     	//const postJsonPromise = gfn_postJSON("/co/msg/deleteComMsgList.do", list);
     	const postJsonPromise = gfn_postJSON("/fm/bbs/deleteBbsList.do", list);

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

    	var nCol = grdBbsList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdBbsList.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = grdBbsList.getRowData(nRow);

        SBUxMethod.set("dtl-input-orngBbsNo", rowData.bbsNo);
        SBUxMethod.set("dtl-select-bbsSeCd", rowData.bbsSeCd);
        SBUxMethod.set("dtl-input-bbsNo", rowData.bbsNo);
        SBUxMethod.set("dtl-input-bbsTitle", rowData.bbsTitle);
        SBUxMethod.set("dtl-input-bbsSubject", rowData.bbsSubject);
        SBUxMethod.set("dtl-input-sysFrstInptUserIdNm", rowData.sysFrstInptUserIdNm);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = grdBbsList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdBbsList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }

</script>
</body>
</html>