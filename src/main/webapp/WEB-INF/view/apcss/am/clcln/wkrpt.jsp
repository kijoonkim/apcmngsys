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
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                </colgroup>
                <tbody>
                    <tr>
                    	<th scope="row" class="th_bg">
                            전재고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-lastWkndWrhs"
                                    name="info-inp-lastWkndWrhs"
                                    class="form-control input-sm"
                                    disabled
                                    autocomplete="off"
                            />
                        </td>
                        <th scope="row" class="th_bg">
                            입고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-totWrhsQntt"
                                    name="info-inp-totWrhsQntt"
                                    class="form-control input-sm"
                                    disabled
                                    autocomplete="off"
                            />
                        </td>
                        <th scope="row" class="th_bg">
                            출고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-totSpmtQntt"
                                    name="info-inp-totSpmtQntt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    disabled
                            />
                        </td>
                        <th scope="row" class="th_bg">
                            현 재고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-totQntt"
                                    name="info-inp-totQntt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    disabled
                            />
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
                            />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
	let weekend = {};
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function () {
        fn_createGrid();
        SBUxMethod.set("srch-dtp-wghYmd", gfn_dateToYmd(new Date()));
        await fn_dtpChange(gfn_dateToYmd(new Date()));
    }

    var jsonWkrpt = [];
    var grdWkrpt;

    const fn_createGrid = async function () {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-wkrpt';
        SBGridProperties.id = 'grdWkrpt';
        SBGridProperties.jsonref = 'jsonWkrpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
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
            {caption : ['4/15 월','거래처'],	ref : 'prdcrNmMon',		width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption : ['4/15 월','수량'],		ref : 'bxQnttMon',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            {caption : ['4/16 월','거래처'],	ref : 'prdcrNmTue',		width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption : ['4/16 월','수량'],		ref : 'bxQnttTue',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            {caption : ['4/17 월','거래처'],	ref : 'prdcrNmWed',		width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption : ['4/17 월','수량'],		ref : 'bxQnttWed',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            {caption : ['4/18 월','거래처'],	ref : 'prdcrNmThu',		width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption : ['4/18 월','수량'],		ref : 'bxQnttThu',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            {caption : ['4/19 월','거래처'],	ref : 'prdcrNmFri',		width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption : ['4/19 월','수량'],		ref : 'bxQnttFri',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            {caption : ['4/20 월','거래처'],	ref : 'prdcrNmSat',		width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption : ['4/20 월','수량'],		ref : 'bxQnttSat',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
            {caption : ['4/21 월','거래처'],	ref : 'prdcrNmSun',		width : '9%',		style : 'text-align:center',	type : 'output'},
            {caption : ['4/21 월','수량'],		ref : 'bxQnttSun',		width : '4%',		style : 'text-align:right',		type : 'output', format : {type:'number', rule:'#,### '}},
        ]
        grdWkrpt = _SBGrid.create(SBGridProperties);
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
	        let result = [...wrhsResult,...spmtResult];
	        SBUxMethod.set("info-inp-totWrhsQntt",totWrhsQntt);
	        SBUxMethod.set("info-inp-totSpmtQntt",totSpmtQntt);
	        SBUxMethod.set("info-inp-totQntt",totWrhsQntt - totSpmtQntt);
	        initObj();
	        jsonWkrpt = result;
	        grdWkrpt.refresh();

	        await fn_searchLastQnttList();
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

    	let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");		// 기준일자
		let wghYmdFrom = subtractDays(wghYmd,7);
		let wghYmdTo = subtractDays(wghYmd,1);



		const postJsonPromise = gfn_postJSON("/am/clcln/selectWkrptLastQnttList.do", {
			apcCd		: gv_selectedApcCd,
			wghYmdFrom 	: wghYmdFrom,
			wghYmdTo	: wghYmdTo
  		});


  		try {

	        const data = await postJsonPromise;

	        let result = data.resultList;
	        if(data.resultList.length > 0){
	        	SBUxMethod.set("info-inp-lastWkndWrhs",data.resultList[0].totInvntrQntt);
	        }else{
	        	SBUxMethod.set("info-inp-lastWkndWrhs","");
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

		let daysofWeek = ['월','화','수','목','금','토','일']

        let mon = fn_formatDateToMMDD(monday, daysofWeek[0]);
		weekend[0] = mon.padLeft(7,'0');
        grdWkrpt.setCellData(0, 1, mon, true);
        let dayDiff = 3;
        for (var i=1; i<=6; i++) {

        	const setDay = new Date(monday);
        	setDay.setDate(monday.getDate() + i);
        	weekend[i] = fn_formatDateToMMDD(setDay, daysofWeek[i]).padLeft(7,'0');
        	grdWkrpt.setCellData(0, dayDiff, fn_formatDateToMMDD(setDay, daysofWeek[i]), true);
        	dayDiff = parseInt(dayDiff) + 2;
        }

        grdWkrpt.refresh();
    }

    const fn_formatDateToMMDD = function (date, toDay) {
        const month = date.getMonth() + 1; // 월은 0부터 시작하므로 +1
        const day = date.getDate();
        return month+'/'+day + " " + toDay;
    }

    /**
     * @name fn_docRawMtrWgh
     * @description 주간입출고현황 발행 버튼
     */
	const fn_docＷeekWrhsSpmt = function() {

		let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");
		let yr = wghYmd.substr(0,4);

		let reportVo = {
			apcCd : gv_selectedApcCd,
			wghYmd : wghYmd,
			ymdFrom : yr + weekend[0].replace("/","").split(" ")[0],
			ymdTo : yr + weekend[6].replace("/","").split(" ")[0],
			...weekend

		}

		gfn_popClipReport("주간입출고현황", "am/weekWrhsSpmt_0599.crf", reportVo);
	}


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
			"apcCd": "0599",
			"bxQnttMon": 0,
			"bxQnttTue": 0,
			"bxQnttWed": 0,
			"bxQnttThu": 0,
			"bxQnttFri": 0,
			"bxQnttSat": 0,
			"bxQnttSun": 0,
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
			"apcCd": "0599",
			"bxQnttMon": 0,
			"bxQnttTue": 0,
			"bxQnttWed": 0,
			"bxQnttThu": 0,
			"bxQnttFri": 0,
			"bxQnttSat": 0,
			"bxQnttSun": 0,
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
				  obj1['prdcrNm' + dateA] = item.prdcrNm;
				  totWrhsQntt += item.bxQntt;
				  wrhsResult.push(obj1);
				  idxWrhsObj[dayIdx] = idxWrhsObj[dayIdx] + 1;
	          }else if(wrhsResult.length > idxWrhsObj[dayIdx]){
	              wrhsResult[idxWrhsObj[dayIdx]]["bxQntt" + dateA] = item.bxQntt;
	              wrhsResult[idxWrhsObj[dayIdx]]["prdcrNm" + dateA] = item.prdcrNm;
	              totWrhsQntt += item.bxQntt;
	              idxWrhsObj[dayIdx] = idxWrhsObj[dayIdx] + 1;
	          }
	    }
	}
	let fn_spmtConvert = function(item,day,dayIdx,dateA){
		if(item.bxQntt !== 0 && item.dy === day){
	          //if(wrhsResult.length === 0 || wrhsResult.length < idxObj[dayIdx]+1){
        	  if(spmtResult.length < idxSpmtObj[dayIdx]+1){
				  let obj1 = {...spmtObj};
				  obj1['bxQntt'+ dateA] = item.bxQntt;
				  obj1['prdcrNm' + dateA] = item.prdcrNm;
				  spmtResult.push(obj1);
				  totSpmtQntt += item.bxQntt;
				  idxSpmtObj[dayIdx] = idxSpmtObj[dayIdx] + 1;
	          }else if(spmtResult.length > idxSpmtObj[dayIdx]){
	              spmtResult[idxSpmtObj[dayIdx]]["bxQntt" + dateA] = item.bxQntt;
	              spmtResult[idxSpmtObj[dayIdx]]["prdcrNm" + dateA] = item.prdcrNm;
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
				"apcCd": "0599",
				"bxQnttMon": 0,
				"bxQnttTue": 0,
				"bxQnttWed": 0,
				"bxQnttThu": 0,
				"bxQnttFri": 0,
				"bxQnttSat": 0,
				"bxQnttSun": 0,
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
				"apcCd": "0599",
				"bxQnttMon": 0,
				"bxQnttTue": 0,
				"bxQnttWed": 0,
				"bxQnttThu": 0,
				"bxQnttFri": 0,
				"bxQnttSat": 0,
				"bxQnttSun": 0,
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
							<td colspan="4"></td>
	`);

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>