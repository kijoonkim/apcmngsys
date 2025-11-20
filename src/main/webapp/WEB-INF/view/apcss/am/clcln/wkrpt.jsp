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
					id="btnSave"
					name="btnSave"
					class="btn btn-sm btn-primary"
					text="저장"
					onclick="fn_save"
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
                                    id="info-inp-lastWkndWght"
                                    name="info-inp-lastWkndWght"
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
                                    id="info-inp-wrhsWght"
                                    name="info-inp-wrhsWght"
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
                                    id="info-inp-spmtWght"
                                    name="info-inp-spmtWght"
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
                                    id="info-inp-nowWght"
                                    name="info-inp-nowWght"
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
</body>
<script type="text/javascript">
	let weekend = {};
    let weekYmd = [];

    let jsonWghPrfmnc = [];

    /** 입출고 구분 */
    let jsonComWrhsSpmtType = [];
    /** 생산자 목록 */
    let jsonPrdcr = [];
    /** 거래처 목록 */
    let jsonCnpt = [];
    /** 생산자, 거래처 목록 */
    let jsonPrdcrCnpt = [];

    /** 요일 인덱스 */
    let daysOfWeek = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function () {
        await fn_createGrid();
        await fn_initSBSelect();
        SBUxMethod.set("srch-dtp-wghYmd", gfn_dateToYmd(new Date()));
        await fn_dtpChange(gfn_dateToYmd(new Date()));
        // await fn_search();
    }

    /**
     * 조회 조건 select combo 설정
     */
    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfn_setComCdSBSelect('grdWkrpt', jsonComWrhsSpmtType, 'WRHS_SPMT_TYPE'),    // 입고출고유형
        ]);

        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);  // 생산자 목록
        jsonCnpt = await fn_selectCnptList();               // 거래처 목록

        jsonPrdcrCnpt = [
            ...jsonPrdcr.map(item => ({
                label: item.prdcrNm,
                value: item.prdcrCd,
                code: "RT"  // 입고시 생산자
            })),
            ...jsonCnpt.map(item => ({
                label: item.cnptNm,
                value: item.cnptCd,
                code: "DT"  // 출고시 거래처
            }))
        ];
    }
    /** createGrid */
    var jsonWkrpt = [];
    var grdWkrpt;

    const fn_createGrid = async function () {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-wkrpt';
        SBGridProperties.id = 'grdWkrpt';
        SBGridProperties.jsonref = 'jsonWkrpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
        SBGridProperties.total = {
        		  type 		: 'sub',
        		  position	: 'bottom',
        		  columns		: {
        		      standard : [0],
        		      sum : [2,3,5,6,8,9,11,12,14,15,17,18,20,21],
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
            {caption : ['구분','구분'],			ref : 'wrhsSpmtTypeNm',	width : '5.5%',		style : 'text-align:center',	type : 'combo',
                typeinfo : {ref:'jsonComWrhsSpmtType', 	displayui : false,	label:'label', value:'value'}},
            {caption: ['4/15 월','거래처'], 		ref: 'prdcrCnptNmMon', 	width: '5.5%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonPrdcrCnpt', 	displayui : false,	itemcount: 10, label:'label', value:'value', emptyvalue: true, filtering: {usemode: true, uppercol: 'wrhsSpmtTypeNm', attrname: 'code', listall: false}}},
            {caption : ['4/15 월','중량'],		ref : 'bxWghtMon',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['4/15 월','수량'],		ref : 'bxQnttMon',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/15 월','계량일자'],	ref : 'wghYmdMon',	type: 'output', hidden: true},

            {caption: ['4/16 월','거래처'], 		ref: 'prdcrCnptNmTue', 	width: '5.5%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonPrdcrCnpt', 	displayui : false,	itemcount: 10, label:'label', value:'value', filtering: {usemode: true, uppercol: 'wrhsSpmtTypeNm', attrname: 'code', listall: false}}},
            {caption : ['4/16 월','중량'],		ref : 'bxWghtTue',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['4/16 월','수량'],		ref : 'bxQnttTue',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/16 월','계량일자'],	ref : 'wghYmdTue',	type: 'output', hidden: true},

            {caption: ['4/17 월','거래처'], 		ref: 'prdcrCnptNmWed', 	width: '5.5%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonPrdcrCnpt', 	displayui : false,	itemcount: 10, label:'label', value:'value', filtering: {usemode: true, uppercol: 'wrhsSpmtTypeNm', attrname: 'code', listall: false}}},
            {caption : ['4/17 월','중량'],		ref : 'bxWghtWed',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['4/17 월','수량'],		ref : 'bxQnttWed',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/17 월','계량일자'],	ref : 'wghYmdWed',	type: 'output', hidden: true},

            {caption: ['4/18 월','거래처'], 		ref: 'prdcrCnptNmThu', 	width: '5.5%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonPrdcrCnpt', 	displayui : false,	itemcount: 10, label:'label', value:'value', filtering: {usemode: true, uppercol: 'wrhsSpmtTypeNm', attrname: 'code', listall: false}}},
            {caption : ['4/18 월','중량'],		ref : 'bxWghtThu',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['4/18 월','수량'],		ref : 'bxQnttThu',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/18 월','계량일자'],	ref : 'wghYmdThu',	type: 'output', hidden: true},

            {caption: ['4/19 월','거래처'], 		ref: 'prdcrCnptNmFri', 	width: '5.5%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonPrdcrCnpt', 	displayui : false,	itemcount: 10, label:'label', value:'value', filtering: {usemode: true, uppercol: 'wrhsSpmtTypeNm', attrname: 'code', listall: false}}},
            {caption : ['4/19 월','중량'],		ref : 'bxWghtFri',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['4/19 월','수량'],		ref : 'bxQnttFri',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/19 월','계량일자'],	ref : 'wghYmdFri',	type: 'output', hidden: true},

            {caption: ['4/20 월','거래처'], 		ref: 'prdcrCnptNmSat', 	width: '5.5%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonPrdcrCnpt', 	displayui : false,	itemcount: 10, label:'label', value:'value', filtering: {usemode: true, uppercol: 'wrhsSpmtTypeNm', attrname: 'code', listall: false}}},
            {caption : ['4/20 월','중량'],		ref : 'bxWghtSat',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['4/20 월','수량'],		ref : 'bxQnttSat',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/20 월','계량일자'],	ref : 'wghYmdSat',	type: 'output', hidden: true},

            {caption: ['4/21 월','거래처'], 		ref: 'prdcrCnptNmSun', 	width: '5.5%', type:'inputcombo',  	style:'text-align:center',
                typeinfo : {ref:'jsonPrdcrCnpt', 	displayui : false,	itemcount: 10, label:'label', value:'value', filtering: {usemode: true, uppercol: 'wrhsSpmtTypeNm', attrname: 'code', listall: false}}},
            {caption : ['4/21 월','중량'],		ref : 'bxWghtSun',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['4/21 월','수량'],		ref : 'bxQnttSun',		width : '4%',		style : 'text-align:right',		type : 'input', format : {type:'number', rule:'#,### '}},
            // {caption : ['4/21 월','계량일자'],	ref : 'wghYmdSun',	type: 'output', hidden: true},
        ]
        grdWkrpt = _SBGrid.create(SBGridProperties);
        grdWkrpt.bind('valuechanged', 'fn_grdValueChanged')
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnld() {
        grdWkrpt.exportLocalExcel("주간입출고 현황", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
        jsonWghPrfmnc.length = 0;

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
	        SBUxMethod.set("info-inp-wrhsWght",totWrhsWght);
	        SBUxMethod.set("info-inp-spmtWght",totSpmtWght);
	        //SBUxMethod.set("info-inp-totQntt",totWrhsWght - totSpmtWght);
	        initObj();
	        jsonWkrpt = result;
            jsonWghPrfmnc = data.resultList;
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

		        let totWrhsWght = data.resultList[0].totWrhsWght;
		        let totSpmtWght = data.resultList[0].totSpmtWght;

		        if (!gfn_isEmpty(totWrhsWght)) {

			        SBUxMethod.set("info-inp-totWrhsWght", totWrhsWght)
				}

		        if (!gfn_isEmpty(totSpmtWght)) {

			        SBUxMethod.set("info-inp-totSpmtWght", totSpmtWght)
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
				SBUxMethod.set("info-inp-nowWght",result[0].nowInvntrQntt);
				SBUxMethod.set("info-inp-lastWkndWght",result[0].lastWkndQntt);
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

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function () {

        let saveList = [];
        let grdData = grdWkrpt.getGridDataAllExceptTotal();

        let groupId = 1;

        // 요일별 반복
        for (let i = 0; i < daysOfWeek.length; i++) {
            let day = daysOfWeek[i];

            let wghnoKey = 'wghno' + day;
            let wghSnKey = 'wghSn' + day;
            let wrhsnoKey = 'wrhsno' + day;
            let pltnoKey = 'pltno' + day;
            let vhclnoKey = 'vhclno' + day;
            let itemCdKey = 'itemCd' + day;
            let vrtyCdKey = 'vrtyCd' + day;
            let bxWghtKey = 'bxWght' + day;
            let bxQnttKey = 'bxQntt' + day;
            let prdcrCnptCdKey = 'prdcrCnptNm' + day;
            let wghYmdKey = 'wghYmd' + day;
            let actlWghtKey = 'actlWght' + day;

            // 행으로 반복
            for (let i = 0; i < grdData.length; i++) {
                let item = grdData[i];
                let wghno = item[wghnoKey];
                let bxWght = item[bxWghtKey] || 0;
                let bxQntt = item[bxQnttKey] || 0;

                // 값이 없으면 skip
                if (!wghno && bxWght === 0 && bxQntt === 0) continue;

                // 기본 VO 객체 생성
                let wghPrfmncVO = {
                    apcCd : gv_selectedApcCd,
                    vhclno : item[vhclnoKey] || '0000',     // 기본 차량번호(임시)
                    wrhsSpmtType : item.wrhsSpmtTypeNm,
                    itemCd : item[itemCdKey] || '1201',     // 양파
                    vrtyCd : item[vrtyCdKey] || '0100',     // 양파(일반)
                    wghYmd : item[wghYmdKey],
                    wrhsWght : bxWght,
                    bxQntt : bxQntt,
                    groupId : groupId++
                };

                // 입고(RT)일 때는 prdcrCd, 출고(DT)일 때는 cnptCd
                if (item.wrhsSpmtTypeNm === 'RT') {
                    wghPrfmncVO.prdcrCd = item[prdcrCnptCdKey] || '';
                } else if (item.wrhsSpmtTypeNm === 'DT') {
                    wghPrfmncVO.cnptCd = item[prdcrCnptCdKey] || '';
                }

                // 신규 등록
                if (gfn_isEmpty(wghno)) {
                    wghPrfmncVO.rowSts = "I";
                    saveList.push(wghPrfmncVO);
                    continue;
                }

                // 기존 데이터 수정/삭제
                wghPrfmncVO.rowSts = "U";
                wghPrfmncVO.wghno = wghno;
                wghPrfmncVO.wghSn = item[wghSnKey];
                wghPrfmncVO.wrhsno = item[wrhsnoKey];
                wghPrfmncVO.pltno = item[pltnoKey];

                // 기존 데이터와 비교
                let existData = jsonWghPrfmnc.find(w => w.wghno == wghno && w.wghSn == item[wghSnKey]);

                if (existData) {
                    // 삭제 (중량과 수량이 모두 0)
                    if (bxWght === 0 && bxQntt === 0) {
                        wghPrfmncVO.dtlDelYn = 'Y';
                        saveList.push(wghPrfmncVO);
                    }
                    // 수정 (값이 변경되었을 때만)
                    else if (existData.prdcrCd != wghPrfmncVO.prdcrCd ||
                             existData.bxQntt != bxQntt ||
                             existData.wrhsWght != bxWght) {
                        let actlWght = parseFloat(item[actlWghtKey]) || 0;
                        if (actlWght > 0) {
                            wghPrfmncVO.rdcdWght = actlWght - bxWght;
                            wghPrfmncVO.rdcdRt = parseFloat(((wghPrfmncVO.rdcdWght / actlWght) * 100).toFixed(1));
                        }
                        saveList.push(wghPrfmncVO);
                    }
                }
            }
        }

        // if (saveList.length == 0) {
        //     gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
        //     return;
        // }

        let wrhsSaveList = saveList.filter(e => e.wrhsSpmtType == 'RT');
        let spmtSaveList = saveList.filter(e => e.wrhsSpmtType == 'DT');

        let crtrYmd = SBUxMethod.get("srch-dtp-wghYmd");		// 기준일자
        let lastWkndWght = SBUxMethod.get("info-inp-lastWkndWght"); // 전재고
        let wrhsWght = SBUxMethod.get("info-inp-wrhsWght"); //입고
        let spmtWght = SBUxMethod.get("info-inp-spmtWght"); //출고
        let nowWght = SBUxMethod.get("info-inp-nowWght"); //현재고
        // let totQntt = SBUxMethod.get("info-inp-totQntt"); //재고
        let loss = SBUxMethod.get("info-inp-loss"); //로스율

        let clclnSaveList = {
            apcCd           : gv_selectedApcCd,
            crtrYmd         : mondayParam,
            wrhsQntt        : wrhsWght,
            spmtQntt        : spmtWght,
            nowInvntrQntt   : nowWght,
            totInvntrQntt   : lastWkndWght,
            lsQntt          : loss
        };

        if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
            const saveRequests = [
                { list: wrhsSaveList, url: "/am/wgh/multiWghPrfmncList.do" },
                { list: spmtSaveList, url: "/am/wgh/updateWghInfoDtlList.do" },
                { list: clclnSaveList, url: "/am/clcln/insertClclnNowInvntr.do" },
            ];

            for (const { list, url } of saveRequests) {
                if (list.length === 0) continue;

                try {
                    const data = await gfn_postJSON(url, list);
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
                    return;
                }
            }

            // 모든 요청이 정상 처리된 경우
            fn_search();
            gfn_comAlert("I0001");					// I0001 처리 되었습니다.
        }
    }

    const fn_grdValueChanged = async function () {
        let totalWrhsWght = 0;      // 입고중량 합
        let totalSpmtWght = 0;      // 출고중량 합

        // 소계 행들의 중량 합계 계산
        grdWkrpt.getTotalRowIndex().forEach(row => {
            const rowData = grdWkrpt.getRowData(row);
            const isWrhs = rowData.subtotalval === 'RT';
            const isSpmt = rowData.subtotalval === 'DT';

            daysOfWeek.forEach(day => {
                const bxWght = parseInt(rowData['bxWght' + day]) || 0;
                if (isWrhs) totalWrhsWght += bxWght;
                if (isSpmt) totalSpmtWght += bxWght;
            });
        });

        // 입고/출고 중량 업데이트
        SBUxMethod.set("info-inp-wrhsWght", totalWrhsWght);
        SBUxMethod.set("info-inp-spmtWght", totalSpmtWght);

        fn_invntrChange();
    }

    /** 거래처 목록 조회 **/
    const fn_selectCnptList = async function () {
        const postJsonPromise = gfn_postJSON(URL_CNPT_INFO, {apcCd: gv_selectedApcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        return data.resultList;
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
        let dayDiff = 4;
        for (var i=1; i<=6; i++) {

        	const setDay = new Date(monday);
        	setDay.setDate(monday.getDate() + i);
        	weekend[i] = fn_formatDateToMMDD(setDay, daysofWeek[i]).padLeft(7,'0');
            weekYmd[i] = fn_formatDateToYYYYMMDD(setDay);
        	grdWkrpt.setCellData(0, dayDiff, fn_formatDateToMMDD(setDay, daysofWeek[i]), true);
        	dayDiff = parseInt(dayDiff) + 3;
        }
        SBUxMethod.refresh("info-inp-lastWkndWght");
        SBUxMethod.refresh("info-inp-wrhsWght");
        SBUxMethod.refresh("info-inp-spmtWght");
        SBUxMethod.refresh("info-inp-loss");
		SBUxMethod.refresh("info-inp-nowWght");
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
		let lastWkndWght = SBUxMethod.get("info-inp-lastWkndWght"); // 전재고
    	let wrhsWght = SBUxMethod.get("info-inp-wrhsWght"); //입고
    	let spmtWght = SBUxMethod.get("info-inp-spmtWght"); //출고
    	let nowWght = SBUxMethod.get("info-inp-nowWght"); //현재고
   		let loss = SBUxMethod.get("info-inp-loss"); //로스율

		let yr = wghYmd.substr(0,4);

		let reportVo = {
			apcCd : gv_selectedApcCd,
			wghYmd : wghYmd,
			ymdFrom : yr + weekend[0].replace("/","").split(" ")[0],
			ymdTo : yr + weekend[6].replace("/","").split(" ")[0],
			...weekend,
			loss : loss,
			lastWkndWrhs : lastWkndWght,
			wrhsQntt : wrhsWght,
			spmtQntt : spmtWght,
			nowQntt : nowWght
		}

        const reportList = jsonWkrpt.map(item => {
            // 입출고 구분명 찾기
            const wrhsSpmtTypeNm = jsonComWrhsSpmtType.find(e => e.value === item.wrhsSpmtTypeNm);

            const report = {
                apcCd: item.apcCd,
                wrhsSpmtTypeNm: wrhsSpmtTypeNm?.label || item.wrhsSpmtTypeNm
            };

            // 요일별 데이터 매핑
            daysOfWeek.forEach(day => {
                report['bxWght' + day] = item['bxWght' + day] || 0;

                // 생산자/거래처명 찾기
                const prdcrCnptNm = jsonPrdcrCnpt.find(e =>
                    e.code === item.wrhsSpmtTypeNm && e.value === item['prdcrCnptNm' + day]
                );
                report['prdcrCnptNm' + day] = prdcrCnptNm?.label || '';
            });

            return report;
        });

		const data = {
		    "root":reportList
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
    let totWrhsWght = 0;
    let totSpmtWght = 0;
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
            "bxWghtMon": 0,
            "bxWghtTue": 0,
            "bxWghtWed": 0,
            "bxWghtThu": 0,
            "bxWghtFri": 0,
            "bxWghtSat": 0,
            "bxWghtSun": 0,
			"bxQnttMon": 0,
			"bxQnttTue": 0,
			"bxQnttWed": 0,
			"bxQnttThu": 0,
			"bxQnttFri": 0,
			"bxQnttSat": 0,
			"bxQnttSun": 0,
			"prdcrCnptNmMon": null,
			"prdcrCnptNmTue": null,
			"prdcrCnptNmWed": null,
			"prdcrCnptNmThu": null,
			"prdcrCnptNmFri": null,
			"prdcrCnptNmSat": null,
			"prdcrCnptNmSun": null,
			"wrhsSpmtTypeNm": "RT"
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
            "bxWghtMon": 0,
            "bxWghtTue": 0,
            "bxWghtWed": 0,
            "bxWghtThu": 0,
            "bxWghtFri": 0,
            "bxWghtSat": 0,
            "bxWghtSun": 0,
			"bxQnttMon": 0,
			"bxQnttTue": 0,
			"bxQnttWed": 0,
			"bxQnttThu": 0,
			"bxQnttFri": 0,
			"bxQnttSat": 0,
			"bxQnttSun": 0,
			"prdcrCnptNmMon": null,
			"prdcrCnptNmTue": null,
			"prdcrCnptNmWed": null,
			"prdcrCnptNmThu": null,
			"prdcrCnptNmFri": null,
			"prdcrCnptNmSat": null,
			"prdcrCnptNmSun": null,
			"wrhsSpmtTypeNm": "DT"
		};
	let wrhsResult = [];
	let spmtResult = [];
	const fn_convert = function(jsonData){
	jsonData.forEach(item => {
	  if(item.wrhsSpmtType === "RT"){
	      if(item.dy === "월"){
	    	  fn_wrhsConvert(item,item.dy,"monIdx","Mon");
	      }
	      if(item.dy === "화"){
	    	  fn_wrhsConvert(item,item.dy,"tueIdx","Tue");
	      }
	      if(item.dy === "수"){
	    	  fn_wrhsConvert(item,item.dy,"wedIdx","Wed");
	      }
	      if(item.dy === "목"){
	    	  fn_wrhsConvert(item,item.dy,"thuIdx","Thu");
	      }
	      if(item.dy === "금"){
	    	  fn_wrhsConvert(item,item.dy,"friIdx","Fri");
	      }
	      if(item.dy === "토"){
	    	  fn_wrhsConvert(item,item.dy,"satIdx","Sat");
	      }
	      if(item.dy === "일"){
	    	  fn_wrhsConvert(item,item.dy,"sunIdx","Sun");
	      }
	  }else if(item.wrhsSpmtType === "DT"){
		  if(item.dy === "월"){
			  fn_spmtConvert(item,item.dy,"monIdx","Mon");
	      }
	      if(item.dy === "화"){
	    	  fn_spmtConvert(item,item.dy,"tueIdx","Tue");
	      }
	      if(item.dy === "수"){
	    	  fn_spmtConvert(item,item.dy,"wedIdx","Wed");
	      }
	      if(item.dy === "목"){
	    	  fn_spmtConvert(item,item.dy,"thuIdx","Thu");
	      }
	      if(item.dy === "금"){
	    	  fn_spmtConvert(item,item.dy,"friIdx","Fri");
	      }
	      if(item.dy === "토"){
	    	  fn_spmtConvert(item,item.dy,"satIdx","Sat");
	      }
	      if(item.dy === "일"){
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
		if(item.dy === day){
	          //if(wrhsResult.length === 0 || wrhsResult.length < idxObj[dayIdx]+1){
        	  if(wrhsResult.length < idxWrhsObj[dayIdx]+1){
				  let obj1 = {...wrhsObj};
                  obj1['wghno'+ dateA] = item.wghno;
                  obj1['wghSn'+ dateA] = item.wghSn;
                  obj1['wrhsno'+ dateA] = item.wrhsno;
                  obj1['pltno'+ dateA] = item.pltno;
                  obj1['vhclno'+ dateA] = item.vhclno;
                  obj1['itemCd'+ dateA] = item.itemCd;
                  obj1['vrtyCd'+ dateA] = item.vrtyCd;
                  obj1['bxWght'+ dateA] = item.acptnWght;
				  obj1['bxQntt'+ dateA] = item.bxQntt;
				  obj1['prdcrCnptNm' + dateA] = item.prdcrCd;
                  obj1['wghYmd' + dateA] = item.wghYmd;
                  obj1['actlWght' + dateA] = item.actlWght;
                  obj1['rdcdRt' + dateA] = item.rdcdRt;
                  obj1['rdcdWght' + dateA] = item.rdcdWght;

				  totWrhsWght += item.acptnWght;
				  wrhsResult.push(obj1);
				  idxWrhsObj[dayIdx] = idxWrhsObj[dayIdx] + 1;
	          }else if(wrhsResult.length > idxWrhsObj[dayIdx]){
                  wrhsResult[idxWrhsObj[dayIdx]]["wghno" + dateA] = item.wghno;
                  wrhsResult[idxWrhsObj[dayIdx]]["wghSn" + dateA] = item.wghSn;
                  wrhsResult[idxWrhsObj[dayIdx]]["wrhsno" + dateA] = item.wrhsno;
                  wrhsResult[idxWrhsObj[dayIdx]]["pltno" + dateA] = item.pltno;
                  wrhsResult[idxWrhsObj[dayIdx]]["vhclno" + dateA] = item.vhclno;
                  wrhsResult[idxWrhsObj[dayIdx]]["itemCd" + dateA] = item.itemCd;
                  wrhsResult[idxWrhsObj[dayIdx]]["vrtyCd" + dateA] = item.vrtyCd;
                  wrhsResult[idxWrhsObj[dayIdx]]["bxWght" + dateA] = item.acptnWght;
                  wrhsResult[idxWrhsObj[dayIdx]]["bxQntt" + dateA] = item.bxQntt;
	              wrhsResult[idxWrhsObj[dayIdx]]["prdcrCnptNm" + dateA] = item.prdcrCd;
                  wrhsResult[idxWrhsObj[dayIdx]]["wghYmd" + dateA] = item.wghYmd;
                  wrhsResult[idxWrhsObj[dayIdx]]["actlWght" + dateA] = item.actlWght;
                  wrhsResult[idxWrhsObj[dayIdx]]["rdcdRt" + dateA] = item.rdcdRt;
                  wrhsResult[idxWrhsObj[dayIdx]]["rdcdWght" + dateA] = item.rdcdWght;

	              totWrhsWght += item.acptnWght;
	              idxWrhsObj[dayIdx] = idxWrhsObj[dayIdx] + 1;
	          }
	    }
	}
	let fn_spmtConvert = function(item,day,dayIdx,dateA){
		if(item.dy === day){
	          //if(wrhsResult.length === 0 || wrhsResult.length < idxObj[dayIdx]+1){
        	  if(spmtResult.length < idxSpmtObj[dayIdx]+1){
				  let obj1 = {...spmtObj};
                  obj1['wghno'+ dateA] = item.wghno;
                  obj1['wghSn'+ dateA] = item.wghSn;
                  obj1['wrhsno'+ dateA] = item.wrhsno;
                  obj1['pltno'+ dateA] = item.pltno;
                  obj1['vhclno'+ dateA] = item.vhclno;
                  obj1['itemCd'+ dateA] = item.itemCd;
                  obj1['vrtyCd'+ dateA] = item.vrtyCd;
                  obj1['bxWght'+ dateA] = item.acptnWght;
				  obj1['bxQntt'+ dateA] = item.bxQntt;
				  obj1['prdcrCnptNm' + dateA] = item.cnptCd;
                  obj1['wghYmd' + dateA] = item.wghYmd;
                  obj1['actlWght' + dateA] = item.actlWght;
                  obj1['rdcdRt' + dateA] = item.rdcdRt;
                  obj1['rdcdWght' + dateA] = item.rdcdWght;

				  spmtResult.push(obj1);
				  totSpmtWght += item.acptnWght;
				  idxSpmtObj[dayIdx] = idxSpmtObj[dayIdx] + 1;
	          }else if(spmtResult.length > idxSpmtObj[dayIdx]){
                  spmtResult[idxSpmtObj[dayIdx]]["wghno" + dateA] = item.wghno;
                  spmtResult[idxSpmtObj[dayIdx]]["wghSn" + dateA] = item.wghSn;
                  spmtResult[idxSpmtObj[dayIdx]]["wrhsno" + dateA] = item.wrhsno;
                  spmtResult[idxSpmtObj[dayIdx]]["pltno" + dateA] = item.pltno;
                  spmtResult[idxSpmtObj[dayIdx]]["vhclno" + dateA] = item.vhclno;
                  spmtResult[idxSpmtObj[dayIdx]]["itemCd" + dateA] = item.itemCd;
                  spmtResult[idxSpmtObj[dayIdx]]["vrtyCd" + dateA] = item.vrtyCd;
                  spmtResult[idxSpmtObj[dayIdx]]["bxWght" + dateA] = item.acptnWght;
                  spmtResult[idxSpmtObj[dayIdx]]["bxQntt" + dateA] = item.bxQntt;
	              spmtResult[idxSpmtObj[dayIdx]]["prdcrCnptNm" + dateA] = item.cnptCd;
                  spmtResult[idxSpmtObj[dayIdx]]["wghYmd" + dateA] = item.wghYmd;
                  spmtResult[idxSpmtObj[dayIdx]]["actlWght" + dateA] = item.actlWght;
                  spmtResult[idxSpmtObj[dayIdx]]["rdcdRt" + dateA] = item.rdcdRt;
                  spmtResult[idxSpmtObj[dayIdx]]["rdcdWght" + dateA] = item.rdcdWght;

	              totSpmtWght += item.acptnWght;
	              idxSpmtObj[dayIdx] = idxSpmtObj[dayIdx] + 1;
	          }
	    }
	}

	let initObj = function(){
		totSpmtWght = 0;
		totWrhsWght = 0;
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
                "bxWghtMon": "",
                "bxWghtTue": "",
                "bxWghtWed": "",
                "bxWghtThu": "",
                "bxWghtFri": "",
                "bxWghtSat": "",
                "bxWghtSun": "",
				"bxQnttMon": "",
				"bxQnttTue": "",
				"bxQnttWed": "",
				"bxQnttThu": "",
				"bxQnttFri": "",
				"bxQnttSat": "",
				"bxQnttSun": "",
				"prdcrCnptNmMon": null,
				"prdcrCnptNmTue": null,
				"prdcrCnptNmWed": null,
				"prdcrCnptNmThu": null,
				"prdcrCnptNmFri": null,
				"prdcrCnptNmSat": null,
				"prdcrCnptNmSun": null,
				"wrhsSpmtTypeNm": "RT"
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
                "bxWghtMon": "",
                "bxWghtTue": "",
                "bxWghtWed": "",
                "bxWghtThu": "",
                "bxWghtFri": "",
                "bxWghtSat": "",
                "bxWghtSun": "",
				"bxQnttMon": "",
				"bxQnttTue": "",
				"bxQnttWed": "",
				"bxQnttThu": "",
				"bxQnttFri": "",
				"bxQnttSat": "",
				"bxQnttSun": "",
				"prdcrCnptNmMon": null,
				"prdcrCnptNmTue": null,
				"prdcrCnptNmWed": null,
				"prdcrCnptNmThu": null,
				"prdcrCnptNmFri": null,
				"prdcrCnptNmSat": null,
				"prdcrCnptNmSun": null,
				"wrhsSpmtTypeNm": "DT"
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
		let lastWkndWght = parseInt(SBUxMethod.get("info-inp-lastWkndWght")) || 0; // 전재고
    	let wrhsWght = parseInt(SBUxMethod.get("info-inp-wrhsWght")) || 0; //입고
    	let spmtWght = parseInt(SBUxMethod.get("info-inp-spmtWght")) || 0; //출고
    	let nowWght = parseInt(SBUxMethod.get("info-inp-nowWght")) || 0; //현재고

    	// if(!lastWkndWght && !nowWght){
    	// 	return;
    	// }

    	// 현재고가 0이면 : 전재고 + 입고 - 출고
    	if(nowWght === 0){
    		nowWght = lastWkndWght + wrhsWght - spmtWght;
            SBUxMethod.set("info-inp-nowWght", nowWght);
    	}

    	let loss = (lastWkndWght + wrhsWght) - (spmtWght + nowWght);
        let lossRt = loss != 0 ? (loss / (lastWkndWght + wrhsWght) * 100).toFixed(1) : 0;
        SBUxMethod.set("info-inp-loss", loss);
        SBUxMethod.set("info-inp-lossRt", lossRt + " %");


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