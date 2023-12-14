<%
 /**
  * @Class Name : apcBbs.jsp
  * @Description : APC게시판 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.10.23   	김호			최초 생성
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
	<title>title : APC게시판</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">

                <!--full content-->
                <div class="box box-solid">
                <div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- APC게시판 -->
				</div>
				<div style="margin-left: auto;">
					<div class="sbt-search-button" style="text-align:right;">
                    <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create" ></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>
                    <!--Button 영역-->

                    </div>
                    <!--조회 영역-->


				        <div class="box-body">

										<table class="table table-bordered tbl_fixed">
											<colgroup>
												<col style="width:10%">
												<col style="width:20%">
												<col style="width:10%">
												<col style="width:20%">
												<col style="width:40%">
											</colgroup>
											<tr>

												<th scope="row" class="th_bg">구분</th>
												<td class="td_input" style="border-right: hidden;">
					                            	<sbux-select id="srch-select-bbsSeCd" name="srch-select-bbsSeCd" uitype="single"
					                                jsondata-ref="jsonComBbsSeCd"
					                                unselected-text="전체"
					                                style="width:120px;">
					                              	</sbux-select>
												</td>
												<th scope="row" class="th_bg">검색</th>
												<td class="td_input" style="border-right: hidden;">
					                            	<sbux-input id="srch-input-bbsTitle" name="srch-input-bbsTitle" uitype="text"
					                                style="width:400px;"
					                                placeholder="">
					                            	</sbux-input>
												</td>
											</tr>
										</table>

									<div class="ad_tbl_top">
										<ul class="ad_tbl_count">
											<li>
												<span style="font-size:14px">게시판목록</span>
												<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
											</li>
										</ul>
									</div>




			                        <li style="display:inline-block;float:left;width: 100%; vertical-align:top;">
			                            <div class="table-responsive tbl_scroll_sm mCustomScrollbar _mCS_2">

			                                <div class="mCustomScrollBox mCS-dark-thin mCSB_horizontal mCSB_inside" style="height:100%">
			                                    <div class="sbt-grid">
			                                        <!-- SBGrid를 호출합니다. -->
			                                        <div id="sb-area-grdBbs" style="height:550px;"></div>
			                                    </div>
			                                </div>
			                            </div>
			                        </li>
                        </div>

         </section>
            <sbux-modal id="modal-bbsModal" name="modal-bbsModal" uitype="large" header-title="상세내용" body-html-id="body-modal-bbsModal" footer-is-close-button="false" header-is-close-button="false" callback-after-close="fn_callSearch" ></sbux-modal>
            <div id="body-modal-bbsModal">
    			<jsp:include page="bbsPopup.jsp"></jsp:include>
    		</div>

    		<sbux-modal id="modal-bbsNewArticlePopup" name="modal-bbsNewArticlePopup" uitype="large" header-title="신규작성" body-html-id="body-modal-bbsNewArticlePopup" footer-is-close-button="false" header-is-close-button="false" callback-after-close="fn_callSearch"></sbux-modal>
         	<div id="body-modal-bbsNewArticlePopup">
    			<jsp:include page="bbsNewArticlePopup.jsp"></jsp:include>
    		</div>
			<sbux-modal id="modal-bbsChildCmntModal" name="modal-bbsChildCmntModal" uitype="small" header-title="답글" body-html-id="body-modal-bbsChildCmntModal" footer-is-close-button="false" header-is-close-button="false" style="width:500px"></sbux-modal>
         	<div id="body-modal-bbsChildCmntModal">
    			<jsp:include page="bbsChildCmntPopup.jsp"></jsp:include>
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
    			['srch-select-bbsSeCd', 'dtl-select-bbsSeCd','dtl-select-newbbsSeCd'],
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
//             {caption: ["번호"],	ref: 'bbsNo',      type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["유형"],  	ref: 'bbsSeCdNm',    type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["제목"], 	ref: 'bbsTitle',     	type:'output',  width:'60%',    style:'text-align:left'},
            {caption: ["내용"],      	ref: 'bbsSubject',        type:'output',  hidden: true},
            {caption: ["등록자"],	ref: 'sysFrstInptUserIdNm',   type:'output' ,width:'10%'  , style:'text-align:center'},
            {caption: ["등록일"],	ref: 'sysFrstInptDtYmd',   type:'output' ,width:'10%'  , style:'text-align:center'},
            //{caption: ['button\n(callback)'],ref:'temp3',width:'10%', style:'text-align:center',type:'button' uitype='modal',target-id:'dtl_bbsModal',typeinfo:{buttonvalue:'상세조회',callback:buttonEvt}},
            {caption: ["APC코드"],	ref: 'apcCd',   type:'output',  hidden: true},
            {caption: ["원본등록자명"],	ref: 'orgUserNm',   type:'output',  hidden: true},
            {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
            {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"], ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"], ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"], ref: 'updProgram',  type:'output',  hidden: true}
        ];

        grdBbsList = _SBGrid.create(SBGridProperties);
        grdBbsList.bind('click', 'fn_view');
        grdBbsList.bind('autocomplete-select-callback','fn_search');
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
    function fn_callSearch(){
    	fn_search();
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
    	//fn_clearForm();

		grdBbsList.clearStatus();

		let bbsSeCd = SBUxMethod.get("srch-select-bbsSeCd");
		//let bbsNo = SBUxMethod.get("srch-input-bbsNo");
		let bbsTitle = SBUxMethod.get("srch-input-bbsTitle");
		let apcCd = gv_apcCd;

       // const postJsonPromise = gfn_postJSON("/co/msg/selectComMsgList.do", {
        const postJsonPromise = gfn_postJSON("/am/bbs/selectBbsList.do", {

        	apcCd : apcCd,
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

					apcCd: item.apcCd,
					bbsNo: item.bbsNo,
					bbsTitle: item.bbsTitle,
					bbsSeCd: item.bbsSeCd,
					bbsSeCdNm: item.bbsSeCdNm,
					bbsSubject: item.bbsSubject,
					orgUserNm : item.orgUserNm,
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
    async function fn_create() {
       	SBUxMethod.openModal('modal-bbsNewArticlePopup');

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
            gfn_comAlert("W0001", "게시판유형");
            return;
        }

    	/* if (!SBUxMethod.get("dtl-input-bbsNo")) {
            gfn_comAlert("E0000", "메시지Key를 입력하세요.");
            return;
        } */




    	if (gfn_isEmpty(bbsNo)) {
    		// 신규 등록
			fn_subInsert(gfn_comConfirm("Q0001", "등록"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(gfn_comConfirm("Q0001", "저장"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (isConfirmed){

    	 if (!isConfirmed) return;

    	//const postJsonPromise = gfn_postJSON("/co/msg/insertComMsg.do", {
    	const postJsonPromise = gfn_postJSON("/am/bbs/insertBbs.do", {
			bbsNo: SBUxMethod.get('dtl-input-bbsNo'),
			bbsSeCd: SBUxMethod.get('dtl-select-bbsSeCd'),
			bbsTitle: SBUxMethod.get('dtl-input-bbsTitle'),
			bbsSubject: SBUxMethod.get('dtl-input-bbsSubject')
		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001", "처리 되었습니다.");
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");
        	}
        } catch(e) {
        }
    }

	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){

		if (!isConfirmed) return;

    	//const postJsonPromise = gfn_postJSON("/co/msg/updateComMsg.do", {
    	const postJsonPromise = gfn_postJSON("/am/bbs/updateBbs.do", {
			bbsNo: SBUxMethod.get('dtl-input-orngBbsNo'),
			bbsSeCd: SBUxMethod.get('dtl-select-bbsSeCd'),
			bbsTitle: SBUxMethod.get('dtl-input-bbsTitle'),
			bbsSubject: SBUxMethod.get('dtl-input-bbsSubject')
		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001", "처리 되었습니다.");
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");
        	}
        } catch(e) {
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
        const rows = grdBbsList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({bbsNo: row.bbsNo});
        	}
        });

        if (list.length == 0) {
        	gfn_comAlert("W0003", "삭제");
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

     	//const postJsonPromise = gfn_postJSON("/co/msg/deleteComMsgList.do", list);
     	const postJsonPromise = gfn_postJSON("/am/bbs/deleteBbsList.do", list);

         const data = await postJsonPromise;

         try {
         	if (_.isEqual("S", data.resultStatus)) {
         		gfn_comAlert("I0001", "처리 되었습니다.");
         		fn_search();
         	} else {
         		gfn_comAlert("E0001");
         	}
         } catch(e) {
         }
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
        SBUxMethod.set("dtl-input-orngApcCd",rowData.apcCd);

        bbs_info = {
				bbsSecd:rowData.bbsSeCd
				, bbsTitle : rowData.bbsTitle
				, bbsSubject : rowData.bbsSubject
		}
        SBUxMethod.openModal('modal-bbsModal');
        SBUxMethod.set("dtl-input-orngBbsNo",rowData.bbsNo);
        fn_callselectComment(rowData.bbsNo);
        fn_callInit(rowData.sysFrstInptUserIdNm);


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