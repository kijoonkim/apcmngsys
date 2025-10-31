<%
    /**
     * @Class Name : clclnCrtrMng.jsp
     * @Description : 정산기준관리 화면
     * @author SI개발부
     * @since 2024.08.31
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.08.31   	신정철			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 -->
            </div>
            <div style="margin-left: auto;">
            	<sbux-button
					id="btnWkrptDoc"
					name="btnWkrptDoc"
					class="btn btn-sm btn-primary"
					text="주간입출고 출력"
					onclick="fn_docWeekWrhsSpmt"
				></sbux-button>
            	<sbux-button
					id="btnNowInvntr"
					name="btnNowInvntr"
					class="btn btn-sm btn-primary"
					text="현재고 저장"
					target-id="modal-prdcr"
					onclick="fn_saveClclnNowInvntr"
				></sbux-button>
                <sbux-button
                        id="btn-reset"
                        name="btn-reset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="초기화"
                        onclick="fn_reset"
                ></sbux-button>
                <sbux-button
                        id="btn-search"
                        name="btn-search"
                        uitype="normal"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_search"
                        text="조회"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <!--[APC] END -->
            <div id="sb-area-wkrpt" style="height: 560px; margin-bottom: 10px; margin-top: 10px"></div>
            <table class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 8.5%">
                    <col style="width: 8.5%">
                    <col style="width: 8.5%">
                    <col style="width: 8.5%">
                    <col style="width: 8.5%">
                    <col style="width: 8.5%">
                    <col style="width: 8.5%">
                    <col style="width: 8.5%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                </colgroup>
                <tbody>
                    <tr>
                    	<th scope="row" class="th_bg">
                            전재고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-lastWkndQntt"
                                    name="info-inp-lastWkndQntt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    onchange="fn_invntrChange(info-inp-lastWkndQntt)"
                                    permit-keycodes-set="num"
                                    exclude-kr="kr"></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">
                            입고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-wrhsQntt"
                                    name="info-inp-wrhsQntt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    disabled></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">
                            출고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-spmtQntt"
                                    name="info-inp-spmtQntt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    disabled></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">
                            현 재고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-nowQntt"
                                    name="info-inp-nowQntt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    permit-keycodes-set="num"
                                    exclude-kr="kr"
                                    onchange="fn_invntrChange(info-inp-nowQntt)"></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">
                            로스율
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-loss"
                                    name="info-inp-loss"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    readonly></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                        	<sbux-input
                                    uitype="text"
                                    id="info-inp-lossRt"
                                    name="info-inp-lossRt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    readonly></sbux-input>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- 입고실적 선택 Modal -->
<div>
    <sbux-modal
            id="modal-rawMtrWrhs"
            name="modal-rawMtrWrhs"
            uitype="middle"
            header-title="입고실적"
            body-html-id="body-modal-rawMtrWrhs"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width:1000px"
    ></sbux-modal>
</div>
<div id="body-modal-rawMtrWrhs">
<%--    <jsp:include page="../../am/popup/rawMtrInvntrPopup.jsp"></jsp:include>--%>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <p>
                    <span style="font-weight:bold;">입고실적</span>
                </p>
                <p>
                    <span style="color:black; font-weight:bold;"></span>
                </p>
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="rawMtrWrhs-btn-search"
                        name="rawMtrWrhs-btn-search"
                        uitype="normal"
                        text="저장"
                        class="btn btn-sm btn-primary"
                        onclick=""
                ></sbux-button>
                <sbux-button
                        id="rawMtrWrhs-btn-close"
                        name="rawMtrWrhs-btn-close"
                        uitype="normal"
                        text="종료"
                        class="btn btn-sm btn-outline-danger"
                        onclick="SBUxMethod.closeModal('modal-rawMtrWrhs');"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: 4%">
                    <col style="width: 4%">
                    <col style="width: 4%">
                    <col style="width: 24%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">APC명</th>
                    <th>
                        <sbux-input id="rawMtrWrhs-inp-apcCd" name="rawMtrWrhs-inp-apcCd" uitype="hidden"></sbux-input>
                        <sbux-input id="rawMtrWrhs-inp-apcNm" name="rawMtrWrhs-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
                    </th>
                    <th scope="row">생산자</th>
                    <th>
                        <sbux-input id="rawMtrWrhs-inp-prdcrCd" name="rawMtrWrhs-inp-prdcrCd" uitype="hidden"></sbux-input>
                        <sbux-input id="rawMtrWrhs-inp-prdcrNm" name="rawMtrWrhs-inp-prdcrNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
                    </th>
                    <th colspan="3" scope="row">입고일자</th>
                    <th class="td_input">
                        <sbux-datepicker
                                id="rawMtrWrhs-dtp-wrhsYmd"
                                name="rawMtrWrhs-dtp-wrhsYmd"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm sbux-pik-group-apc"
                                onchange=""
                        ></sbux-datepicker>
                    </th>
                </tr>
                </tbody>
            </table>
            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->
            <div class="ad_section_top">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>입고실적 내역</span>
                            <span style="font-size:12px">(조회건수 <span id="rawMtrWrhs-pop-cnt">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div id="sb-area-grdRawMtrWrhs" style="width:100%;height:300px;"></div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
	let weekend = {};
    let weekYmd = [];

    /** 생산자 목록 */
    let jsonGrdPrdcr = []

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function () {
        await fn_createGrid();
        await fn_createRawMtrWrhsGrid();
        await fn_initSBSelect();
        SBUxMethod.set("srch-dtp-wghYmd", gfn_dateToYmd(new Date()));
        await fn_dtpChange(gfn_dateToYmd(new Date()));
        // await fn_search();
    }

    /**
     * 조회 조건 select combo 설정
     */
    const fn_initSBSelect = async function() {
        // 검색 SB select
        let rst = await Promise.all([
            gfn_setPrdcrSBSelect('grdWkrpt', jsonGrdPrdcr, gv_selectedApcCd),	// 생산자
        ]);
    }
    /** createGrid */
    var jsonWkrpt = [];
    var grdWkrpt;

    var jsonRawMtrWrhs = [];
    var grdRawMtrWrhs;

    const fn_createGrid = async function () {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-wkrpt';
        SBGridProperties.id = 'grdWkrpt';
        SBGridProperties.jsonref = 'jsonWkrpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.total = {
        		  type 		: 'sub',
        		  position	: 'bottom',
        		  columns		: {
        		      standard : [0],
        		      sum : [2,4,6,8,10,12,14],
        		  },
        		  subtotalrow : {
        			  0 : {
        	                titlecol    : 0,
        	                titlevalue  : '소계',
        	                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
        	                stylestartcol   : 0
        	            },
        		  },
        		  datasorting	: true,
        		  usedecimal : false,
        		};
        SBGridProperties.columns = [
            {caption : ['구분','구분'],			ref : 'wrhsSpmtTypeNm',	width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption: ['4/15 월','거래처'], 		ref: 'prdcrNmMon', 	width: '9%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption : ['4/15 월','수량'],		ref : 'bxQnttMon',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/15 월','계량일자'],	ref : 'wghYmdMon',	type: 'output', hidden: true},

            {caption: ['4/16 월','거래처'], 		ref: 'prdcrNmTue', 	width: '9%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption : ['4/16 월','수량'],		ref : 'bxQnttTue',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/16 월','계량일자'],	ref : 'wghYmdTue',	type: 'output', hidden: true},

            {caption: ['4/17 월','거래처'], 		ref: 'prdcrNmWed', 	width: '9%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption : ['4/17 월','수량'],		ref : 'bxQnttWed',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/17 월','계량일자'],	ref : 'wghYmdWed',	type: 'output', hidden: true},

            {caption: ['4/18 월','거래처'], 		ref: 'prdcrNmThu', 	width: '9%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption : ['4/18 월','수량'],		ref : 'bxQnttThu',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/18 월','계량일자'],	ref : 'wghYmdThu',	type: 'output', hidden: true},

            {caption: ['4/19 월','거래처'], 		ref: 'prdcrNmFri', 	width: '9%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption : ['4/19 월','수량'],		ref : 'bxQnttFri',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/19 월','계량일자'],	ref : 'wghYmdFri',	type: 'output', hidden: true},

            {caption: ['4/20 월','거래처'], 		ref: 'prdcrNmSat', 	width: '9%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption : ['4/20 월','수량'],		ref : 'bxQnttSat',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/20 월','계량일자'],	ref : 'wghYmdSat',	type: 'output', hidden: true},

            {caption: ['4/21 월','거래처'], 		ref: 'prdcrNmSun', 	width: '9%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption : ['4/21 월','수량'],		ref : 'bxQnttSun',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/21 월','계량일자'],	ref : 'wghYmdSun',	type: 'output', hidden: true},
        ]
        grdWkrpt = _SBGrid.create(SBGridProperties);
        grdWkrpt.bind('click', 'fn_searchWrhsSpmtDtl')
    }

    const fn_search = async function () {

    	let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");		// 기준일자

    	// 입력된 날짜 문자열을 Date 객체로 변환 (YYYYMMDD 형식)
        const year = parseInt(wghYmd.slice(0, 4), 10);
        const month = parseInt(wghYmd.slice(4, 6), 10) - 1; // 월은 0부터 시작
        const day = parseInt(wghYmd.slice(6, 8), 10);

        const currentDate = new Date(year, month, day);

        // 현재 날짜의 요일을 구합니다. (0: 일요일, 1: 월요일, ..., 6: 토요일)
        const dayOfWeek = currentDate.getDay();

        // 월요일까지의 차이를 구합니다.
        const diffToMonday = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;

        // 월요일 날짜 구하기
        const monday = new Date(currentDate);
        monday.setDate(currentDate.getDate() + diffToMonday);

        const sunday = new Date(monday);
        sunday.setDate(monday.getDate() + 6);

    	let wghYmdFrom = gfn_dateToYmd(monday);
    	let wghYmdTo = gfn_dateToYmd(sunday);

		const postJsonPromise = gfn_postJSON("/am/clcln/selectWkrptList.do", {
			apcCd		: gv_selectedApcCd,
			wghYmd		: wghYmd,
			wghYmdFrom 	: wghYmdFrom,
			wghYmdTo	: wghYmdTo
  		});

		jsonWkrpt.length = 0;

  		try {

	        const data = await postJsonPromise;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
	        fn_convert(data.resultList);

            /** 입력할 수 있게 빈값 추가 */
            for (let i = spmtResult.length; i < 9; i++) {
                spmtResult.push({...spmtObj});
            }

            for (let i = wrhsResult.length; i < 9; i++) {
                wrhsResult.push({...wrhsObj});
            }

	        let result = [...spmtResult, ...wrhsResult];
	        SBUxMethod.set("info-inp-wrhsQntt",totWrhsQntt);
	        SBUxMethod.set("info-inp-spmtQntt",totSpmtQntt);
	        //SBUxMethod.set("info-inp-totQntt",totWrhsQntt - totSpmtQntt);
	        initObj();
	        jsonWkrpt = result;
	        await fn_searchLastQnttList();

            jsonWkrpt.forEach((item, index) => {
                item.wghYmdMon = weekYmd[0];
                item.wghYmdTue = weekYmd[1];
                item.wghYmdWed = weekYmd[2];
                item.wghYmdThu = weekYmd[3];
                item.wghYmdFri = weekYmd[4];
                item.wghYmdSat = weekYmd[5];
                item.wghYmdSun = weekYmd[6];
            });
	        grdWkrpt.refresh();

	        //await fn_searchLastQnttList();
          	/* data.resultList.forEach((item, index) => {
  				const wkrpt = {
  						apcCd 			: item.apcCd
  					  , bxQnttMon		: item.bxQnttMon
  					  , bxQnttTue		: item.bxQnttTue
  					  , bxQnttWed		: item.bxQnttWed
  					  , bxQnttThu		: item.bxQnttThu
  					  , bxQnttFri		: item.bxQnttFri
  					  , bxQnttSat		: item.bxQnttSat
  					  , bxQnttSun		: item.bxQnttSun
  					  , prdcrNmMon		: item.prdcrNmMon
  					  , prdcrNmTue		: item.prdcrNmTue
  					  , prdcrNmWed		: item.prdcrNmWed
  					  , prdcrNmThu		: item.prdcrNmThu
  					  , prdcrNmFri		: item.prdcrNmFri
  					  , prdcrNmSat		: item.prdcrNmSat
  					  , prdcrNmSun		: item.prdcrNmSun
  					  , wrhsSpmtTypeNm	: item.wrhsSpmtTypeNm
  				}
  				jsonWkrpt.push(wkrpt);
  			});

          	if (data.resultList.length > 0) {

		        let totWrhsQntt = data.resultList[0].totWrhsQntt;
		        let totSpmtQntt = data.resultList[0].totSpmtQntt;

		        if (!gfn_isEmpty(totWrhsQntt)) {

			        SBUxMethod.set("info-inp-totWrhsQntt", totWrhsQntt)
				}

		        if (!gfn_isEmpty(totSpmtQntt)) {

			        SBUxMethod.set("info-inp-totSpmtQntt", totSpmtQntt)
				}
          	}
			*/

          	//fn_dtpChange(wghYmd);

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
    //전재고조회
    const fn_searchLastQnttList = async function () {

    	let crtrYmd = SBUxMethod.get("srch-dtp-wghYmd");		// 기준일자



		const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnNowInvntrList.do", {
			apcCd		: gv_selectedApcCd,
			crtrYmd     : mondayParam
  		});


  		try {

	        const data = await postJsonPromise;

	        let result = data.resultList;

			if(result.length != 0){
				SBUxMethod.set("info-inp-nowQntt",result[0].nowInvntrQntt);
				SBUxMethod.set("info-inp-lastWkndQntt",result[0].lastWkndQntt);
				fn_invntrChange("");
			}
	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }



		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }

  //전재고등록
    const fn_saveClclnNowInvntr = async function () {

    	let crtrYmd = SBUxMethod.get("srch-dtp-wghYmd");		// 기준일자
    	let lastWkndWrhs = SBUxMethod.get("info-inp-lastWkndQntt"); // 전재고
    	let wrhsQntt = SBUxMethod.get("info-inp-wrhsQntt"); //입고
    	let spmtQntt = SBUxMethod.get("info-inp-spmtQntt"); //출고
    	let nowQntt = SBUxMethod.get("info-inp-nowQntt"); //현재고
    	let totQntt = SBUxMethod.get("info-inp-totQntt"); //재고
   		let loss = SBUxMethod.get("info-inp-loss"); //로스율


		const postJsonPromise = gfn_postJSON("/am/clcln/insertClclnNowInvntr.do", {
			apcCd		: gv_selectedApcCd,
			crtrYmd		: mondayParam,
			wrhsQntt	: wrhsQntt,
			spmtQntt	: spmtQntt,
			nowInvntrQntt		: nowQntt,
			totInvntrQntt		: totQntt,
			lsQntt		: loss
  		});


  		try {

	        const data = await postJsonPromise;

	        let result = data.resultList;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }

    const fn_createRawMtrWrhsGrid = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdRawMtrWrhs';
        SBGridProperties.id = 'grdRawMtrWrhs';
        SBGridProperties.jsonref = 'jsonRawMtrWrhs';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'none';
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            // {
            //     caption : ["<input type='checkbox' onchange='fn_checkAll(grdRawMtrWrhs, this);'>"],
            //     ref: 'checkedYn', type: 'checkbox',  width:'50px',
            //     style: 'text-align:center',
            //     userattr: {colNm: "checkedYn"},
            //     typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}
            // },
            {caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["계량대"],		ref: 'fcltNm',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["생산자"],		ref: 'prdcrNm',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["참여조직명"],	ref: 'prdcrNm',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["품목"],		ref: 'itemNm',      type:'output',  width:'90px',    style:'text-align:center'},
            {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'90px',    style:'text-align:center'},
            {caption: ["입고구분"],		ref: 'wrhsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
            {caption: ["운송구분"],		ref: 'trsprtSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
            {caption: ["상품구분"],		ref: 'gdsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
            {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'90px',    style:'text-align:center'},
            {caption: ["운송료"],		ref: 'trsprtCst',      type:'output',  width:'120px', hidden:true,   style:'text-align:right', format : {type:'number', rule:'#,### 원 '}},
            {caption: ["등급"],		ref: 'grdNm',      type:'output',  width:'80px',    style:'text-align:center'},
            {
                caption: ["입고수량"],
                ref: 'wrhsQntt',
                type:'output',
                width:'100px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###.###'
                }
            },
            {
                caption: ["입고중량 (Kg)"],
                ref: 'wrhsWght',
                type:'output',
                width:'100px',
                style:'text-align:right',
                format : {
                    type:'number',
                    rule:'#,###.###'
                }
            },
            {
                caption: ["현재고수량"],
                ref: 'invntrQntt',
                type:'output',
                width:'100px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {type:'number', rule:'#,###.###'}
            },
            {
                caption: ["현재고중량 (Kg)"],
                ref: 'invntrWght',
                type:'output',
                width:'100px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {type:'number', rule:'#,###.###'}
            },
            {caption: ["단가"],ref: 'untPrc',type:'output',width:'100px',style:'text-align:right',typeinfo : {mask : {alias : 'numeric'}},format : {type:'number', rule:'#,##0  '}},
            {caption: ["공급가"],ref: 'splyPrc',type:'output',width:'100px',style:'text-align:right',typeinfo : {mask : {alias : 'numeric'}},format : {type:'number', rule:'#,##0  '}},
            {caption: ["보관창고"],		ref: 'warehouseSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["계량번호"],		ref: 'wghno',      type:'output',  width:'140px',    style:'text-align:center'},
            {caption: ["팔레트번호"],	ref: 'pltno',      type:'output',  width:'140px',    style:'text-align:center'},
            {caption: ["처리구분"],		ref: 'prcsTypeNm',      type:'output',  width:'140px',    style:'text-align:center'},
            {caption: ["비고"],		ref: 'rmrk',      type:'output',  width:'200px',    style:'text-align:center'},
            {caption: ["입고번호"],		ref: 'wrhsno',		type:'output',  hidden: true},
        ];
        grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
    }


    /**
     * @name fn_searchWrhsSpmtDtl
     * @description 재고실적 상세 내역 조회
     */
    const fn_searchWrhsSpmtDtl = async function() {

        const nRow = grdWkrpt.getRow();
        const nCol = grdWkrpt.getCol();
        if (nRow == -1) {
            return;
        }

        /**
         * qntt col 확인 후 이전 col 거래처(생산자) 값이 있는 지 확인
         * 1. 거래처(생산자) 값이 있으면 param = {prdcrCd, wghYmd} 입출고(계량)실적 조회
         * 2. 모달창 열어서 조회한 각 실적마다 수량 수정할 수 있도록 그리고 바로 저장
         * 3. callbackfnc - 수량 세팅
         * 4. 재고 수정 후 보여주기
         * */

        const getColRef = grdWkrpt.getRefOfCol(nCol);
        if (getColRef.includes('Qntt')) {

            // if (gfn_isEmpty(getPrdcrCd)) {
            //     gfn_comAlert("W0001", "거래처");		//	W0001	{0}을/를 선택하세요.
            //     return;
            // }

            const getRowData = grdWkrpt.getRowData(nRow);

            const getDay = getColRef.slice(-3);

            const prdcrCd = getRowData['prdcrNm' + getDay];
            const wghYmd = getRowData['wghYmd' + getDay];
            const prdcrNm = gfn_isEmpty(prdcrCd) ? "" : jsonGrdPrdcr.filter(e => e.prdcrCd == prdcrCd)[0].prdcrNm;

            console.log(prdcrCd, wghYmd);
            let params = {
                apcCd   : gv_selectedApcCd,
                apcNm   : gv_selectedApcNm,
                wghYmd  : wghYmd,
                prdcrCd : prdcrCd,
                prdcrNm : prdcrNm
            }

            fn_modalRawMtrWrhs(params);
        }


    }

    /**
     * @name fn_modalRawMtrWrhs
     * @description 입고실적선택팝업 호출
     */
    const fn_modalRawMtrWrhs = async function(params) {
        SBUxMethod.openModal('modal-rawMtrWrhs');
        // popRawMtrInvntr.init({apcCd : gv_selectedApcCd, apcNm : gv_selectedApcNm}, fn_setRawMtrInvntr);
        SBUxMethod.set('rawMtrWrhs-inp-apcCd', params.apcCd);
        SBUxMethod.set('rawMtrWrhs-inp-apcNm', params.apcNm);

        SBUxMethod.set('rawMtrWrhs-inp-prdcrCd', params.prdcrCd);
        SBUxMethod.set('rawMtrWrhs-inp-prdcrNm', params.prdcrNm);

        SBUxMethod.set('rawMtrWrhs-dtp-wrhsYmd', params.wghYmd);

        /**
         * TODO.
         * 상세 실적 조회
         * 1. 입고, 출고 구분해서 각각 실적 조회
         * */

        const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsPrfmncList.do", {
            apcCd       : params.apcCd,
            wrhsYmdFrom : params.wghYmd,
            wrhsYmdTo   : params.wghYmd,
            prdcrCd     : params.prdcrCd
        });

        try {

            const data = await postJsonPromise;

            let result = data.resultList;

            console.log(result);

            jsonRawMtrWrhs.length;
            jsonRawMtrWrhs = [...result];
            grdRawMtrWrhs.refresh();

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
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
     * @name fn_setrawMtrWrhs
     * @description 입고실적 선택 callback
     */
    const fn_setrawMtrWrhs = function(rawMtrWrhs) {
        if (!gfn_isEmpty(rawMtrWrhs)) {
            SBUxMethod.set('srch-inp-rawMtrWrhs', rawMtrWrhs.pltno);
        }
    }

    const fn_dtpChange = async function (ymd) {
    	jsonWkrpt.length = 0;
    	grdWkrpt.rebuild();

    	// 입력된 날짜 문자열을 Date 객체로 변환 (YYYYMMDD 형식)
        const year = parseInt(ymd.slice(0, 4), 10);
        const month = parseInt(ymd.slice(4, 6), 10) - 1; // 월은 0부터 시작
        const day = parseInt(ymd.slice(6, 8), 10);

        const currentDate = new Date(year, month, day);

        // 현재 날짜의 요일을 구합니다. (0: 일요일, 1: 월요일, ..., 6: 토요일)
        const dayOfWeek = currentDate.getDay();

        // 월요일까지의 차이를 구합니다.
        const diffToMonday = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;

        // 월요일 날짜 구하기
        const monday = new Date(currentDate);
        monday.setDate(currentDate.getDate() + diffToMonday);
        mondayParam = monday.toLocaleDateString('sv-SE').replace(/-/g, '');

		let daysofWeek = ['월','화','수','목','금','토','일']

        let mon = fn_formatDateToMMDD(monday, daysofWeek[0]);
        let monYmd = fn_formatDateToYYYYMMDD(monday);
		weekend[0] = mon.padLeft(7,'0');
        weekYmd[0] = monYmd;
        grdWkrpt.setCellData(0, 1, mon, true);
        let dayDiff = 3;
        for (var i=1; i<=6; i++) {

        	const setDay = new Date(monday);
        	setDay.setDate(monday.getDate() + i);
        	weekend[i] = fn_formatDateToMMDD(setDay, daysofWeek[i]).padLeft(7,'0');
            weekYmd[i] = fn_formatDateToYYYYMMDD(setDay);
        	grdWkrpt.setCellData(0, dayDiff, fn_formatDateToMMDD(setDay, daysofWeek[i]), true);
        	dayDiff = parseInt(dayDiff) + 2;
        }
        SBUxMethod.refresh("info-inp-lastWkndQntt");
        SBUxMethod.refresh("info-inp-wrhsQntt");
        SBUxMethod.refresh("info-inp-spmtQntt");
        SBUxMethod.refresh("info-inp-loss");
		SBUxMethod.refresh("info-inp-nowQntt");
        grdWkrpt.refresh();

        await fn_search();
    }

    const fn_formatDateToMMDD = function (date, toDay) {
        const month = date.getMonth() + 1; // 월은 0부터 시작하므로 +1
        const day = date.getDate().toString().padLeft(2,'0');
        return month.toString().padLeft(2,'0') +'/'+day + " " + toDay;
    }

    const fn_formatDateToYYYYMMDD = function (date) {
        const year = date.getFullYear();
        // 월은 0부터 시작하므로 +1
        // 월이 1~9일 경우 앞에 '0'을 추가
        const month = String(date.getMonth() + 1).padStart(2, '0');
        // 일이 1~9일 경우 앞에 '0'을 추가합니다.
        const day = String(date.getDate()).padStart(2, '0');

        return year.toString() + month.toString() + day.toString();
    }

    /**
     * @name fn_docRawMtrWgh
     * @description 주간입출고현황 발행 버튼
     */
	const fn_docWeekWrhsSpmt = function() {

		let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");
		let lastWkndWrhs = SBUxMethod.get("info-inp-lastWkndQntt"); // 전재고
    	let wrhsQntt = SBUxMethod.get("info-inp-wrhsQntt"); //입고
    	let spmtQntt = SBUxMethod.get("info-inp-spmtQntt"); //출고
    	let nowQntt = SBUxMethod.get("info-inp-nowQntt"); //현재고
   		let loss = SBUxMethod.get("info-inp-loss"); //로스율

		let yr = wghYmd.substr(0,4);

		let reportVo = {
			apcCd : gv_selectedApcCd,
			wghYmd : wghYmd,
			ymdFrom : yr + weekend[0].replace("/","").split(" ")[0],
			ymdTo : yr + weekend[6].replace("/","").split(" ")[0],
			...weekend,
			loss : loss,
			lastWkndWrhs : lastWkndWrhs,
			wrhsQntt : wrhsQntt,
			spmtQntt : spmtQntt,
			nowQntt : nowQntt


		}

		const data = {
			      "root":jsonWkrpt
			    }

	    const conn = [];
	    conn.push({data: data});

	    gfn_popClipReportPost(
	            "주간입출고현황",
	            "am/weekWrhsSpmt_0599.crf",
	            reportVo,
	            conn,
	    );


		//gfn_popClipReport("주간입출고현황", "am/weekWrhsSpmt_0599.crf", reportVo);
	}



	let mondayParam = "";
    let totWrhsQntt = 0;
    let totSpmtQntt = 0;
	let idxWrhsObj = {
			monIdx : 0
			, tueIdx : 0
			, wedIdx : 0
			, thuIdx : 0
			, friIdx : 0
			, satIdx : 0
			, sunIdx : 0
	}
	let idxSpmtObj = {
			monIdx : 0
			, tueIdx : 0
			, wedIdx : 0
			, thuIdx : 0
			, friIdx : 0
			, satIdx : 0
			, sunIdx : 0
	}
	let wrhsObj = {
			"apcCd": gv_apcCd,
            "wghYmdMon": "",
            "wghYmdTue": "",
            "wghYmdWed": "",
            "wghYmdThu": "",
            "wghYmdFri": "",
            "wghYmdSat": "",
            "wghYmdSun": "",
			"bxQnttMon": "",
			"bxQnttTue": "",
			"bxQnttWed": "",
			"bxQnttThu": "",
			"bxQnttFri": "",
			"bxQnttSat": "",
			"bxQnttSun": "",
			"prdcrNmMon": null,
			"prdcrNmTue": null,
			"prdcrNmWed": null,
			"prdcrNmThu": null,
			"prdcrNmFri": null,
			"prdcrNmSat": null,
			"prdcrNmSun": null,
			"wrhsSpmtTypeNm": "입고"
		};
	let spmtObj = {
			"apcCd": gv_apcCd,
            "wghYmdMon": "",
            "wghYmdTue": "",
            "wghYmdWed": "",
            "wghYmdThu": "",
            "wghYmdFri": "",
            "wghYmdSat": "",
            "wghYmdSun": "",
			"bxQnttMon": "",
			"bxQnttTue": "",
			"bxQnttWed": "",
			"bxQnttThu": "",
			"bxQnttFri": "",
			"bxQnttSat": "",
			"bxQnttSun": "",
			"prdcrNmMon": null,
			"prdcrNmTue": null,
			"prdcrNmWed": null,
			"prdcrNmThu": null,
			"prdcrNmFri": null,
			"prdcrNmSat": null,
			"prdcrNmSun": null,
			"wrhsSpmtTypeNm": "출고"
		};
	let wrhsResult = [];
	let spmtResult = [];
	const fn_convert = function(jsonData){
	jsonData.forEach(item => {
	  if(item.wrhsSpmtTypeNm=== "입고"){
	      if(item.bxQnttSum !== 0 && item.dy === "월"){
	    	  fn_wrhsConvert(item,item.dy,"monIdx","Mon");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "화"){
	    	  fn_wrhsConvert(item,item.dy,"tueIdx","Tue");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "수"){
	    	  fn_wrhsConvert(item,item.dy,"wedIdx","Wed");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "목"){
	    	  fn_wrhsConvert(item,item.dy,"thuIdx","Thu");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "금"){
	    	  fn_wrhsConvert(item,item.dy,"friIdx","Fri");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "토"){
	    	  fn_wrhsConvert(item,item.dy,"satIdx","Sat");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "일"){
	    	  fn_wrhsConvert(item,item.dy,"sunIdx","Sun");
	      }
	  }else if(item.wrhsSpmtTypeNm === "출고"){
		  if(item.bxQnttSum !== 0 && item.dy === "월"){
			  fn_spmtConvert(item,item.dy,"monIdx","Mon");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "화"){
	    	  fn_spmtConvert(item,item.dy,"tueIdx","Tue");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "수"){
	    	  fn_spmtConvert(item,item.dy,"wedIdx","Wed");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "목"){
	    	  fn_spmtConvert(item,item.dy,"thuIdx","Thu");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "금"){
	    	  fn_spmtConvert(item,item.dy,"friIdx","Fri");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "토"){
	    	  fn_spmtConvert(item,item.dy,"satIdx","Sat");
	      }
	      if(item.bxQnttSum !== 0 && item.dy === "일"){
	    	  fn_spmtConvert(item,item.dy,"sunIdx","Sun");
	      }
	  }

	})
	}
	//item : 입출고데이터
	//day : 월화수목금토일
	//dayIdx : 인덱스
	//dateA : Tue,Fri...
	let fn_wrhsConvert = function(item,day,dayIdx,dateA){
		if(item.bxQntt !== 0 && item.dy === day){
	          //if(wrhsResult.length === 0 || wrhsResult.length < idxObj[dayIdx]+1){
        	  if(wrhsResult.length < idxWrhsObj[dayIdx]+1){
				  let obj1 = {...wrhsObj};
				  obj1['bxQntt'+ dateA] = item.bxQntt;
				  obj1['prdcrNm' + dateA] = item.prdcrCd;
                  obj1['wghYmd' + dateA] = item.wghYmd;
				  totWrhsQntt += item.bxQntt;
				  wrhsResult.push(obj1);
				  idxWrhsObj[dayIdx] = idxWrhsObj[dayIdx] + 1;
	          }else if(wrhsResult.length > idxWrhsObj[dayIdx]){
	              wrhsResult[idxWrhsObj[dayIdx]]["bxQntt" + dateA] = item.bxQntt;
	              wrhsResult[idxWrhsObj[dayIdx]]["prdcrNm" + dateA] = item.prdcrCd;
                  wrhsResult[idxWrhsObj[dayIdx]]["wghYmd" + dateA] = item.wghYmd;
	              totWrhsQntt += item.bxQntt;
	              idxWrhsObj[dayIdx] = idxWrhsObj[dayIdx] + 1;
	          }
	    }
	}
	let fn_spmtConvert = function(item,day,dayIdx,dateA){
		if(item.bxQntt !== 0 && item.dy === day){
	          //if(wrhsResult.length === 0 || wrhsResult.length < idxObj[dayIdx]+1){
        	  if(spmtResult.length < idxSpmtObj[dayIdx]+1){
                  console.log(item.wghYmd);
				  let obj1 = {...spmtObj};
				  obj1['bxQntt'+ dateA] = item.bxQntt;
				  obj1['prdcrNm' + dateA] = item.prdcrCd;
                  obj1['wghYmd' + dateA] = item.wghYmd;
				  spmtResult.push(obj1);
				  totSpmtQntt += item.bxQntt;
				  idxSpmtObj[dayIdx] = idxSpmtObj[dayIdx] + 1;
	          }else if(spmtResult.length > idxSpmtObj[dayIdx]){
	              spmtResult[idxSpmtObj[dayIdx]]["bxQntt" + dateA] = item.bxQntt;
	              spmtResult[idxSpmtObj[dayIdx]]["prdcrNm" + dateA] = item.prdcrCd;
                  spmtResult[idxSpmtObj[dayIdx]]["wghYmd" + dateA] = item.wghYmd;
	              totSpmtQntt += item.bxQntt;
	              idxSpmtObj[dayIdx] = idxSpmtObj[dayIdx] + 1;
	          }
	    }
	}

	let initObj = function(){
		totSpmtQntt = 0;
		totWrhsQntt = 0;
		idxWrhsObj = {
				monIdx : 0
				, tueIdx : 0
				, wedIdx : 0
				, thuIdx : 0
				, friIdx : 0
				, satIdx : 0
				, sunIdx : 0
		}
		idxSpmtObj = {
				monIdx : 0
				, tueIdx : 0
				, wedIdx : 0
				, thuIdx : 0
				, friIdx : 0
				, satIdx : 0
				, sunIdx : 0
		}
		wrhsObj = {
				"apcCd": gv_selectedApcCd,
                "wghYmdMon": "",
                "wghYmdTue": "",
                "wghYmdWed": "",
                "wghYmdThu": "",
                "wghYmdFri": "",
                "wghYmdSat": "",
                "wghYmdSun": "",
                "bxQnttMon": "",
                "bxQnttTue": "",
                "bxQnttWed": "",
                "bxQnttThu": "",
                "bxQnttFri": "",
                "bxQnttSat": "",
                "bxQnttSun": "",
				"bxQnttMon": "",
				"bxQnttTue": "",
				"bxQnttWed": "",
				"bxQnttThu": "",
				"bxQnttFri": "",
				"bxQnttSat": "",
				"bxQnttSun": "",
				"prdcrNmMon": null,
				"prdcrNmTue": null,
				"prdcrNmWed": null,
				"prdcrNmThu": null,
				"prdcrNmFri": null,
				"prdcrNmSat": null,
				"prdcrNmSun": null,
				"wrhsSpmtTypeNm": "입고"
			};
		spmtObj = {
				"apcCd": gv_selectedApcCd,
                "wghYmdMon": "",
                "wghYmdTue": "",
                "wghYmdWed": "",
                "wghYmdThu": "",
                "wghYmdFri": "",
                "wghYmdSat": "",
                "wghYmdSun": "",
                "bxQnttMon": "",
                "bxQnttTue": "",
                "bxQnttWed": "",
                "bxQnttThu": "",
                "bxQnttFri": "",
                "bxQnttSat": "",
                "bxQnttSun": "",
				"bxQnttMon": "",
				"bxQnttTue": "",
				"bxQnttWed": "",
				"bxQnttThu": "",
				"bxQnttFri": "",
				"bxQnttSat": "",
				"bxQnttSun": "",
				"prdcrNmMon": null,
				"prdcrNmTue": null,
				"prdcrNmWed": null,
				"prdcrNmThu": null,
				"prdcrNmFri": null,
				"prdcrNmSat": null,
				"prdcrNmSun": null,
				"wrhsSpmtTypeNm": "출고"
			};
		wrhsResult = [];
		spmtResult = [];
	}

	const subtractDays = function(dateStr, days) {
	    // 문자열을 연도, 월, 일로 분리
	    const year = parseInt(dateStr.substring(0, 4), 10);
	    const month = parseInt(dateStr.substring(4, 6), 10) - 1; // 월은 0부터 시작
	    const day = parseInt(dateStr.substring(6, 8), 10);

	    // 날짜 객체 생성 후 days 만큼 빼기
	    const date = new Date(year, month, day);
	    date.setDate(date.getDate() - days);

	    // 결과를 YYYYMMDD 형식으로 변환
	    const newYear = date.getFullYear();
	    const newMonth = String(date.getMonth() + 1).padStart(2, '0');
	    const newDay = String(date.getDate()).padStart(2, '0');

	    return newYear.toString() + newMonth.toString() + newDay.toString();
	}

	const fn_invntrChange = function(id){
		let lastWkndWrhs = SBUxMethod.get("info-inp-lastWkndQntt"); // 전재고
    	let wrhsQntt = SBUxMethod.get("info-inp-wrhsQntt"); //입고
    	let spmtQntt = SBUxMethod.get("info-inp-spmtQntt"); //출고
    	let nowQntt = SBUxMethod.get("info-inp-nowQntt"); //현재고

    	if(gfn_nvl(lastWkndWrhs) == "" || gfn_nvl(nowQntt) == ""){
    		return;
    	}

    	let loss =  (parseInt(spmtQntt) + parseInt(nowQntt)) - (parseInt(lastWkndWrhs) + parseInt(wrhsQntt));
    	SBUxMethod.set("info-inp-loss",loss);

	}


    /** 마지막 셀 병합 수정 **/
    $('table:first tr:first td:last').remove();

    /** apc 명 옆 append **/
    $('table:first tr:first').append(`<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
							<td colspan="3" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wghYmd"
									name="srch-dtp-wghYmd"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wghYmd)"
								></sbux-datepicker>
							</td>
							<td colspan="5"></td>
	`);

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>