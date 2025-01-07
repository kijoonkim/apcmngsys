<%
 /**
  * @Class Name : rawMtrWrhsPrfmncTot.jsp
  * @Description :원물입고실적집계
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
	<title>title : 원물입고실적집계</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고실적집계 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDoc"
						name="btnDoc"
						uitype="normal"
						text="리포트"
						class="btn btn-sm btn-success"
						onclick="fn_doc"
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
							<th scope="row" class="th_bg">기준일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
										id="srch-dtp-crtrYmd"
										name="srch-dtp-crtrYmd"
										uitype="popup"
										date-format="yyyy-mm-dd"
										class="form-control input-sm sbux-pik-group-apc input-sm-ast"
										group-id="srch">
								</sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">집계기간구분</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
										uitype="single"
										id="srch-slt-termKndCd"
										name="srch-slt-termKndCd"
										class="form-control input-sm input-sm-ast"
										jsondata-ref="jsonTotTermKnd"
										jsondata-value="cdVl"
										jsondata-text="cdVlNm"
										onchange=""
								/>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
										unselected-text="전체"
										uitype="single"
										id="srch-slt-itemCd"
										name="srch-slt-itemCd"
										class="form-control input-sm input-sm-ast"
										jsondata-ref="jsonApcItem"
										onchange="fn_onChangeSrchItemCd(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
										unselected-text="전체"
										uitype="single"
										id="srch-slt-vrtyCd"
										name="srch-slt-vrtyCd"
										class="form-control input-sm input-sm-ast"
										jsondata-ref="jsonApcVrty"
										jsondata-value="itemVrtyCd"
										onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td></td>
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
									<span>원물입고 실적집계</span>
									<span style="font-size:12px">(조회건수 <span id="cnt-totRslt">0</span>건)</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdTotRslt" style="height:70vh;"></div>
 					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	const __TOT_CRTR_TYPE__ = 'RP';

	var jsonApcItem			= [];	// 품목 		itemCd
	var jsonApcVrty			= [];	// 품종 		vrtyCd

	var jsonTotTermKnd		= [];	// 집계기간구분

	var grdTotRslt;
	var jsonTotRslt			= [];

	let reportCol = {};


	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

    const fn_init = async function() {

    	SBUxMethod.set("srch-dtp-crtrYmd",gfn_dateToYmd(new Date()));
		let result = await Promise.all([
			gfn_getComCdDtls('TOT_TERM_KND'),
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 	gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, 	gv_apcCd),			// APC 품종(저장)
		]);

		jsonTotTermKnd = result[0];
		SBUxMethod.refresh("srch-slt-termKndCd");

		await fn_setTermGrid();

		//await fn_createGrid();
    }

    const fn_createGrid = async function(termKndCd, columns) {

		// 기준일자 + 기간구분으로 컬럼 check
		const termKndColumns = [];
		var sumCols = [];

		if (!gfn_isEmpty(columns) && Array.isArray(columns)) {

			columns.forEach((item, index) => {
				const colId = "" + index;
				let colNm = "";
				let reportColNm = "";
				switch (termKndCd) {
					case "MM":
						colNm += item.colMmYear.substr(2, 2) + "년 " + item.colMmMonth + "월";
						reportColNm += item.colMmYear.substr(2, 2) + "년" + item.colMmMonth + "월";
						break;
					case "YY":
						colNm += item.colYy + "년";

						break;
					case "QY":
						colNm += item.colQyYear + "년 " + item.colQyMonth + "분기";
						break;
					case "HY":
						colNm += item.colHyYear + "년 " + (_.isEqual('1', item.colHyMonth) ? "상" : "하") + "반기";
						break;
					default:
						return;
				}

				if (!_.isEqual("MM", termKndCd)) {
					reportColNm = colNm;
					if (index > 5) {
						return;
					}
				}
				reportCol[termKndCd.toLowerCase() + index] = reportColNm;

				termKndColumns.push(
					{
						caption: [colNm,"중량 (Kg)"],
						ref: 'wght' + colId,
						type: 'output',
						width:'90px',
						style: 'text-align:right',
						format : {type:'number', rule:'#,###'}
					},
					{
						caption: [colNm,"수량"],
						ref: 'qntt' + colId,
						type: 'output',
						width:'90px',
						style: 'text-align:right',
						format : {type:'number', rule:'#,###'}
					},
				);
			});
		}

		let sumStartCol = 3;
		let colCount = 0;
		if (_.isEqual("MM", termKndCd)) {
			colCount = 13 * 2;
		} else {
			colCount = 6 * 2;
		}

		for (let i=sumStartCol; i<sumStartCol+colCount; i++) {
			sumCols.push(i);
		}

        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdTotRslt';
	    SBGridProperties.id = 'grdTotRslt';
	    SBGridProperties.jsonref = 'jsonTotRslt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.frozencols = 2;
		SBGridProperties.useinitsorting 	= true;
		SBGridProperties.frozenbottomrows 	= 1;

		SBGridProperties.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : sumCols,
				sum : sumCols,
			},
			grandtotalrow : {
				titlecol 	: 1,
				titlevalue	: '합계',
				style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
				stylestartcol	: 0
			},
			datasorting	: true,
		};

		console.log(SBGridProperties.total);

        SBGridProperties.columns = [
			{
				caption: ["품목","품목"],
				ref: 'itemNm',
				type: 'output',
				width:'80px',
				style: 'text-align:center'
			},
			{
				caption: ["품종","품종"],
				ref: 'vrtyNm',
				type: 'output',
				width:'80px',
				style: 'text-align:center'
			},
			{
				caption: ["생산자","생산자"],
				ref: 'prdcrNm',
				type: 'output',
				width:'80px',
				style: 'text-align:center'
			},
        ];

		// push ...
		termKndColumns.reverse().forEach(item => {
			SBGridProperties.columns.push(item);
		})

		SBGridProperties.columns.push(
			{
				caption: ["합계","수량"],
				ref: 'totQntt',
				type: 'output',
				width:'80px',
				style: 'text-align:right',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption: ["합계","중량 (Kg)"],
				ref: 'totWght',
				type: 'output',
				width:'80px',
				style: 'text-align:right',
				format : {type:'number', rule:'#,###'}
			},
		);

        grdTotRslt = _SBGrid.create(SBGridProperties);
    }

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function(skipGridInit) {

		const termKndCd = SBUxMethod.get("srch-slt-termKndCd");
		const crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");

		if (gfn_isEmpty(crtrYmd)) {
			gfn_comAlert("W0001", "기준일자");
			return;
		}

		if (gfn_isEmpty(termKndCd)) {
			gfn_comAlert("W0001", "집계기간구분");
			return;
		}

		if (!skipGridInit) {
			await fn_setTermGrid();
		}

		await fn_setGrdTotRslt();
	}

	const fn_setTermGrid = async function() {

		const termKndCd = SBUxMethod.get("srch-slt-termKndCd");
		const crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");

		try {
			const columns = [];
			const postJsonPromise = gfn_postJSON("/am/tot/selectTotRsltTermList.do", {
				apcCd: gv_selectedApcCd
				, totCrtrType: __TOT_CRTR_TYPE__
				, termKndCd: termKndCd
				, crtrYmd: crtrYmd
			});

			const data = await postJsonPromise;
			if (_.isEqual("S", data.resultStatus)) {
				data.resultList.forEach((item, index) => {
					columns.push(item);
				});

				await fn_createGrid(termKndCd, columns);
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	const fn_setGrdTotRslt = async function() {

		const termKndCd = SBUxMethod.get("srch-slt-termKndCd");
		const crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");				// 품목
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");				// 품종

		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = vrtyCd.substring(0, 4);
			vrtyCd = vrtyCd.substring(4);
		}

		jsonTotRslt.length = 0;
		try {

			let totalRecordCount = 0;
			const postJsonPromise = gfn_postJSON("/am/tot/selectTotRawMtrWrhsList.do", {
				apcCd: gv_selectedApcCd,
				totCrtrType: __TOT_CRTR_TYPE__,
				termKndCd: termKndCd,
				crtrYmd: crtrYmd,
				itemCd: itemCd,
				vrtyCd: vrtyCd
			});

			const data = await postJsonPromise;
			if (_.isEqual("S", data.resultStatus)) {
				data.resultList.forEach((item, index) => {
					jsonTotRslt.push(item);
				});
			}
			grdTotRslt.rebuild();
			totalRecordCount = jsonTotRslt.length;
			document.querySelector('#cnt-totRslt').innerText = totalRecordCount;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
		]);
	}


	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		if (!gfn_isEmpty(vrtyCd)) {
			const itemCd = vrtyCd.substring(0,4);
			if (!gfn_isEmpty(vrtyCd)) {
				SBUxMethod.set("srch-slt-itemCd", itemCd);
				await fn_onChangeSrchItemCd({value: itemCd});
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
			}
		}else{
			await fn_onChangeSrchItemCd({value: null});
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


    /**
	 * @name fn_doc
	 * @description 리포트 발행
	 */
	const fn_doc = async function() {

		if (gfn_isEmpty(reportCol)) {
			return;
		}

		//HY : 반기별 , MM : 월별 , QY : 분기별 , YY : 연도별
		const termKndCd = SBUxMethod.get("srch-slt-termKndCd");
		const crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");

		reportCol['termKndCd'] = termKndCd;

		let rstlData = {
				data: {
					"root": jsonTotRslt
				},
			}
		let colData = {
			data: {
				"root": [reportCol],
			},
		}
		const conn = [];
		conn.push(rstlData, colData);

 		//gfn_popClipReport("원물입고 실적집계", rptUrl,null, data);

 		gfn_popClipReportPost("원물입고 실적집계", "am/totRsltRawMtrPrfmnc.crf",null, conn);
 	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>