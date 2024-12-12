<%
 /**
  * @Class Name : spmtPrfmncTot.jsp
  * @Description : 출하실적집계
  * @author SI개발부
  * @since 2024.10.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.23   	박승진			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 출하실적집계</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적집계 -->
				</div>
				<div style="margin-left: auto;">
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
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
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
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonVrty"></sbux-select> -->
<!-- 							</td> -->
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyNm"
									name="srch-inp-vrtyNm"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
								<sbux-input
									uitype="hidden"
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchVrty"
									name="btnSrchVrty"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vrty"
									onclick="fn_modalVrty"
								/>
							</td>
							<th scope="row" class="th_bg">집계 기간</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-radio
									id="srch-rdo-json"
									name="srch-rdo-json"
									uitype="normal"
									jsondata-ref="radioJsonData"
									jsondata-text="dtlNm"
									jsondata-value="dtlCd"
									text-right-padding="10px"
									onchange="fn_radioChange(srch-rdo-json)" >
								</sbux-radio>
							</td>
							<th scope="row" class="th_bg">기준일자</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
                                    id="dtl-dtp-crtrYmd"
                                    name="dtl-dtp-crtrYmd"
                                    uitype="popup"
                                    date-format="yyyy/mm/dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast"
									onchange="fn_dtpChange(dtl-dtp-crtrYmd)"
									group-id="group1">
                               	</sbux-datepicker>
							</td>

						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div style="display: flex; flex-direction: column; height: 40vh">
 					<div class="row">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>출하실적집계</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdRawMtrInvntrTot" style="height:60vh;"></div>
 					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!--  품목 선택 Modal -->
   	<div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">



	const fn_initSBSelect = async function() {
		let result = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, 	gv_apcCd),			// APC 품종(저장)
			await fn_totCrtrInfoList("DP","TOT_TERM_KND")
        ]);


		let  jsonTermKndTest  = await gfn_getComCdDtls('TOT_TERM_KND');
		jsonTermKndTest[0]['checked'] = "checked";
		jsonTermKnd = jsonTermKndTest;

	}

	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}

	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyNms = [];
			var _vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyNms.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNms.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
    	fn_createRawMtrInvntrTot();
    	SBUxMethod.set("dtl-dtp-crtrYmd",gfn_dateToYmd(new Date()));


    	 radioJsonData = jsonTotCrtrDtlList;
    	 SBUxMethod.refresh("srch-rdo-json");


    	let radio = SBUxMethod.get("srch-rdo-json");
		fn_radioChange(radio);
		//fn_search();
    }

    var radioJsonData = [];




	//품목
	var jsonApcItem = [];

	//품종
	var jsonApcVrty = [];

	//기간 저장용
	var dateSaveList = [];

	//집계기준상세
	var jsonTotCrtrDtlList = [];

	//기간
	var jsonTermKnd = [];

    // grid
    // 원물재고집계 현황
    var grdRawMtrInvntrTot;
    var jsonRawMtrInvntrTot = [];



    const fn_createRawMtrInvntrTot = function(columns) {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrInvntrTot';
	    SBGridProperties.id = 'grdRawMtrInvntrTot';
	    SBGridProperties.jsonref = 'jsonRawMtrInvntrTot';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'byrow';

        SBGridProperties.columns = [
        	{caption: ["품목"],  ref: 'itemNm', type:'input', width:'10%',  style:'text-align:center'},
            {caption: ["품종"],  ref: 'vrtyNm', type:'input', width:'10%',  style:'text-align:center'},
        ];

        if(gfn_nvl(columns)!==""){
        	columns.forEach(item => {
            	SBGridProperties.columns.push(item);
            })
        }


        SBGridProperties.columns.push({caption: ["총수량"],  ref: 'totQntt', type:'input', width:'10%',  style:'text-align:center'});
        SBGridProperties.columns.push({caption: ["현재고"],  ref: 'sttnInvntrQntt', type:'input', width:'10%',  style:'text-align:center'});

        grdRawMtrInvntrTot = _SBGrid.create(SBGridProperties);
        //grdTotCrtrList.bind('click', 'fn_grdTotCrtrClick');

    }

    const fn_dtpChange = function(obj){
    	let radio = SBUxMethod.get("srch-rdo-json");
    	fn_radioChange(radio);
    }

    const fn_radioChange = function(obj){
    	let columns = [];
    	dateSaveList = [];
    	jsonRawMtrInvntrTot.length = 0;
    	let crtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
    	let dateCrtrYmd = stringToDate(crtrYmd);
    	if(obj === "day"){
			let dates = getWeeklyDates(dateCrtrYmd);
			dates.forEach((item,index) => {
				let replaceItem = item.replaceAll("-","");
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = replaceItem;
				col["ref"] = replaceItem;
				dateSaveList.push(replaceItem);
				columns.push(col);
			})

    	}else if(obj === "week"){
    		let dates = getMonthlyWeeks(dateCrtrYmd);
			dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = (index + 1) + "주차"
				col["ref"] = "col" + (index + 1);
				dateSaveList.push(item);
				columns.push(col);
			})

    	}else if(obj === "MM"){
    		//월별
    		let dates = getLastTwelveMonths(dateCrtrYmd);
    		dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = item
				col["ref"] = "col" + (index+1);
				dateSaveList.push(item);
				columns.push(col);
			})

    	}else if(obj === "QY"){
    		//분기별
    		let dates = getQuarterDates(dateCrtrYmd);
    		dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = (index + 1) + "/4 분기"
				col["ref"] = "col" + (index+1);
				dateSaveList.push(item);
				columns.push(col);
			})
    	}else if(obj === "YY"){
    		//연도별
    		let dates = getLastFourYears(dateCrtrYmd);
    		dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = item.toString()
				col["ref"] = "col" + (index+1);
				dateSaveList.push(item.toString());
				columns.push(col);
			})
    	}else if(obj === "HY"){
    		//반기
    		let dates = getHalfDates(dateCrtrYmd);
    		dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = item.nm;
				col["ref"] = "h" + (index+1);
				dateSaveList.push(item.toString());
				columns.push(col);
			})
    	}
    	grdRawMtrInvntrTot.destroy();
    	fn_createRawMtrInvntrTot(columns);
    }



    /**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	let copy = structuredClone(dateSaveList);
		let startDay = copy[0].replaceAll("-","");
		let endDay = copy.pop().replaceAll("-","");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");

		 const postJsonPromise = gfn_postJSON("/am/tot/selectSpmtPrfmncTotInfo.do", {
			apcCd: gv_selectedApcCd
			, itemCd : itemCd
			, vrtyCd : vrtyCd
			, totYmdFrom : startDay
			, totYmdEnd : endDay
  		});

        const data = await postJsonPromise;

  		try {
 			if (_.isEqual("S", data.resultStatus)) {

  	      		jsonRawMtrInvntrTot.length = 0;

  	      		jsonRawMtrInvntrTot = convertArrayToCamelCase(data.resultList);
  	      		let totalRow = {};

	  	      	const dayResult = jsonRawMtrInvntrTot.reduce((acc, item) => {
		  	          // Iterate through each key-value pair in the object
		  	          Object.keys(item).forEach(key => {
		  	              // If the key represents a date, add the value to the result
		  	              if (key >= startDay && key <= endDay ) {
		  	                  acc[key] = (acc[key] || 0) + item[key];
		  	              }
		  	              if (key === "totQntt") {
		  	                  acc[key] = (acc[key] || 0) + item[key];
		  	              }
		  	          });
		  	          return acc;
		  	      }, {});

	  	      	const totalCount = data.resultList.length; // Number of objects in the data array
	  	    	const avgResult = Object.keys(dayResult).reduce((acc, key) => {
	  	    		let avg = dayResult[key] / totalCount;
	  	        	acc[key] = avg.toFixed(1);
	  	        return acc;
	  	    	}, {});

	  	      //dayResult["itemNm"] = "합계";
	  	      dayResult["vrtyNm"] = "합계";
	  	      avgResult["vrtyNm"] = "평균";
	  	      jsonRawMtrInvntrTot.push(dayResult);
	  	      jsonRawMtrInvntrTot.push(avgResult);

  	          grdRawMtrInvntrTot.rebuild();
 			 }
  		}
 		catch (e) {
 	            if (!(e instanceof Error)) {
 	                e = new Error(e);
 	            }
 	            console.error("failed", e.message);
 	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
 	    }
	}


    /**
     * @name fn_totCrtrInfoList
     * @description 집계기준 버튼
     */
    const fn_totCrtrInfoList = async function(totCrtrType,crtrCd) {


    	const postJsonPromise = gfn_postJSON("/am/tot/selectTotCrtrInfoDtlList.do", {
			apcCd: gv_selectedApcCd,
			totCrtrType : totCrtrType,
			crtrCd : crtrCd
  		});

        const data = await postJsonPromise;

  		try {
 			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;
  	      	    jsonTotCrtrDtlList.length = 0;
  	      		jsonTotCrtrDtlList = data.resultList;
 			 }
  		}
 		catch (e) {
 	            if (!(e instanceof Error)) {
 	                e = new Error(e);
 	            }
 	            console.error("failed", e.message);
 	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
 	    }
	}




    const fn_save = async function(){
    	let rowData = grdTotCrtrList.getRowData(grdTotCrtrList.getRow());
    	let status1 = grdTotCrtrList.getRowStatus(grdTotCrtrList.getRow());
		if(rowData === undefined){
			return;
		}
        try{

        	let totCrtr = {
        			apcCd : gv_selectedApcCd
        			, totCrtrType : rowData.totCrtrType
        			, crtrCd : rowData.crtrCd
        			, crtrVl : rowData.crtrVl
        			, crtrIndctNm : mergeArray.find(item => item.cdVl === "VRTY")['cdVlNm']
        			, indctSeq : parseInt(rowData.indctSeq)
        			, useYn : rowData.useYn
        			, status : status1
      				, totDtlType : rowData.totDtlType
        	};



			let totCrtrDtlList = grdTotCrtrDtlList.getGridDataAll();
			    totCrtrDtlList.forEach((item,sn) => {
					delete item.itemCd;
					item["apcCd"] = gv_selectedApcCd;
        			item["totCrtrType"] = rowData.totCrtrType;
        			item["crtrCd"] = rowData.crtrCd;
        			item["crtrVl"] = rowData.crtrVl;
					item["apcCd"] = gv_selectedApcCd;
					item["dtlIndctNm"] = item["dtlVl"];
				});

            let totDtlList = totCrtrDtlList.filter(x => x.status === "3" || x.status ==="2")



            let postJsonPromise = gfn_postJSON("/am/tot/insertTotCrtrInfoList.do",[totCrtr,totDtlList]);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    //gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    //fn_reset();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
    }


    function getWeeklyDates(date) {
        const today = date;
        const dayOfWeek = today.getDay(); // 0 (일요일) ~ 6 (토요일)
        const startOfWeek = date;
        startOfWeek.setDate(today.getDate() - dayOfWeek); // 이번 주의 첫 날 (일요일)

        const dates = [];
        for (let i = 0; i < 7; i++) {
            const currentDate = new Date(startOfWeek);
            currentDate.setDate(startOfWeek.getDate() + i);
            dates.push(currentDate.toISOString().split('T')[0]); // YYYY-MM-DD 형식으로 추가
        }

        return dates;
    }



    function getMonthlyWeeks(date) {
        const today = date;
        const year = today.getFullYear();
        const month = today.getMonth(); // 현재 월 (0: 1월, 11: 12월)

        const firstDayOfMonth = new Date(year, month, 1);
        const lastDayOfMonth = new Date(year, month + 1, 0); // 해당 월의 마지막 날

        const weeks = [];
        let startOfWeek = new Date(firstDayOfMonth);

        while (startOfWeek <= lastDayOfMonth) {
            const endOfWeek = new Date(startOfWeek);
            endOfWeek.setDate(startOfWeek.getDate() + 6); // 시작일로부터 6일 후

            // 종료일이 월의 마지막 날을 초과하면 월의 마지막 날로 설정
            if (endOfWeek > lastDayOfMonth) {
                endOfWeek.setTime(lastDayOfMonth.getTime());
            }

            weeks.push({
                startOfWeek: startOfWeek.toISOString().split('T')[0],
                endOfWeek: endOfWeek.toISOString().split('T')[0],
            });

            // 다음 주의 시작일로 이동
            startOfWeek.setDate(startOfWeek.getDate() + 7);
        }

        return weeks;
    }


    function getLastTwelveMonths(date) {
        const today = date;
        const months = [];

        for (let i = 0; i < 12; i++) {
            const pastMonth = new Date(today.getFullYear(), today.getMonth()+1 - i, 1);
            months.push(pastMonth.toISOString().split('T')[0].slice(0, 7)); // YYYY-MM 형식
        }

        return months.reverse(); // 과거부터 현재까지 정렬
    }


    function getHalfDates(date) {
        const today = date;
        const year = today.getFullYear();
        const half = [];

        const startMonth = 1;
        const startOfQuarter = new Date(year, 0, 1); //1월 1일
        const middleOfQuarter = new Date(year, 5, 30); // 6월 30일
        const endOfQuarter = new Date(year, 11, 31); // 12월31일

        half.push({
        	nm : "상반기",
            start: startOfQuarter.toISOString().split('T')[0],
            end: middleOfQuarter.toISOString().split('T')[0]
        });

        half.push({
        	nm : "하반기",
        	start: middleOfQuarter.toISOString().split('T')[0],
        	end: endOfQuarter.toISOString().split('T')[0]
        });
        return half;
    }

    function getQuarterDates(date) {
        const today = date;
        const year = today.getFullYear();
        const quarters = [];

        for (let i = 0; i < 4; i++) {
            const startMonth = i * 3;
            const startOfQuarter = new Date(year, startMonth, 1);
            const endOfQuarter = new Date(year, startMonth + 3, 0); // 0은 이전 달의 마지막 날

            quarters.push({
                startOfQuarter: startOfQuarter.toISOString().split('T')[0],
                endOfQuarter: endOfQuarter.toISOString().split('T')[0],
            });
        }
        return quarters;
    }


    function getLastFourYears(date) {
        const thisYear = date.getFullYear();
        const years = [];

        for (let i = 3; i >= 0; i--) {
            years.push(thisYear - i);
        }

        return years;
    }

    function stringToDate(dateString) {
        const year = parseInt(dateString.slice(0, 4), 10);
        const month = parseInt(dateString.slice(4, 6), 10) - 1; // 월은 0부터 시작
        const day = parseInt(dateString.slice(6, 8), 10);

        return new Date(year, month, day);
    }

    /** camelCase FN **/
    function toCamelCase(snakeStr) {
        return snakeStr.toLowerCase().replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
    }

    function convertArrayToCamelCase(array) {
        return array.map(obj => {
            return Object.keys(obj).reduce((acc, key) => {
                const camelKey = toCamelCase(key);
                acc[camelKey] = obj[key];
                return acc;
            }, {});
        });
    }











</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>