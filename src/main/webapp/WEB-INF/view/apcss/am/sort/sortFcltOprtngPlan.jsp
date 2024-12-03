<%
    /**
     * @Class Name : sortFcltOprtngPlan.jsp
     * @Description : 가동 계획 등록(선별)
     * @author SI개발부
     * @since 2024.09.10
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.09.10   	박승진		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 가동 계획 등록(선별)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>

    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 가동 계획 등록(선별) -->
                </div>
                <div style="margin-left: auto;">


                    <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                    <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>

                </div>
            </div>
            <div class="box-body">
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <div>
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
							<th scope="row" class="th_bg">계획연월</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-planYm"
									name="srch-dtp-planYm"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode="month"
									class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-planYm)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">

							</td>
							<td style="border-right: hidden;"></td>
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
						</tr>
					</tbody>
				</table>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>선별 계획</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdSortPlan"></div>
                    </div>
                    <div style="display: flex;gap: 3vw">
                        <div style="flex: 1.6">

                            <table id="sortFcltTable" class="table table-bordered tbl_fixed">
                                <caption>검색 조건 설정</caption>
                                <colgroup>
                                    <col style="width: 15%">
                                    <col style="width: 35%">
                                    <col style="width: 15%">
                                    <col style="width: 35%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="th_bg">품목</th>
                                        <td class="td_input">
                                            <sbux-select
                                            	id="dtl-inp-itemCd"
                                            	name="dtl-inp-itemCd"
                                            	uitype="single"
                                            	class="form-control input-sm"
                                            	jsondata-ref="jsonApcItemCd"
												group-id="group1"
                                            	>
                                            </sbux-select>
                                        </td>
                                        <th scope="row" class="th_bg">품종</th>
                                        <td class="td_input">
                                            <sbux-select
                                            	id="dtl-inp-vrtyCd"
                                            	name="dtl-inp-vrtyCd"
                                            	uitype="single"
                                            	class="form-control input-sm"
                                            	jsondata-ref="jsonApcVrtyCd"
                                            	filter-source-name="dtl-inp-itemCd"
                                                jsondata-filter = "itemCd"
												group-id="group1"
                                            	>
                                            </sbux-select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">투입유형</th>
                                        <td class="td_input" >
                                            <sbux-select
                                                    id="dtl-slt-inptType"
                                                    name="dtl-slt-inptType"
                                                    uitype="single"
                                                    jsondata-ref="jsonInptType"
                                                    unselected-text="전체"
                                                    class="form-control input-sm input-sm-ast"
                                                    group-id="group1"
                                            ></sbux-select>
                                        </td>
                                        <th scope="row" class="th_bg">계획번호</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-planNo" name="dtl-inp-planNo" uitype="text" class="form-control input-sm" group-id="group1">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">투입수량</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-inptQntt" name="dtl-inp-inptQntt" uitype="text" class="form-control input-sm"  group-id="group1"
                                            		 permit-keycodes-set="num" exclude-kr="kr">
                                            </sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">투입중량</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-inptWght" name="dtl-inp-inptWght" uitype="text" class="form-control input-sm" group-id="group1"
                                            		 permit-keycodes-set="num" exclude-kr="kr">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">작업수량</th>
                                        <td class="td_input" >
                                            <sbux-input id="dtl-inp-planQntt" name="dtl-inp-planQntt" uitype="text" class="form-control input-sm" group-id="group1"
                                            		 permit-keycodes-set="num" exclude-kr="kr">
                                        </td>
                                        <th scope="row" class="th_bg">작업중량</th>
                                        <td class="td_input" >
                                            <sbux-input id="dtl-inp-planWght" name="dtl-inp-planWght" uitype="text" class="form-control input-sm" group-id="group1"
                                            		 permit-keycodes-set="num" exclude-kr="kr">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">시작일자/시각</th>
                                        <td class="td_input">
                                            <sbux-datepicker
                                            		id="dtl-dtp-bgngYmd"
                                            		name="dtl-dtp-bgngYmd"
                                            		uitype="popup"
                                            		date-format="yyyy/mm/dd HH:MM"
													show-time-bar="true"
													class="form-control input-sm sbux-pik-group-apc input-sm-ast"
													onchange = "fn_dtpValidate"
													group-id="group1">
                                    		</sbux-datepicker>
                                        </td>
                                        <th scope="row" class="th_bg">종료일자/시각</th>
                                        <td class="td_input">
                                           <sbux-datepicker
                                           		id="dtl-dtp-endYmd"
                                           		name="dtl-dtp-endYmd"
                                           		uitype="popup"
												date-format="yyyy/mm/dd HH:MM"
												show-time-bar="true"
												class="form-control input-sm sbux-pik-group-apc input-sm-ast"
												onchange="fn_dtpValidate"
												group-id="group1">
											</sbux-datepicker>
                                        </td>
                                    </tr>
                                    <tr style="height: 5vh">
                                        <th rowspan="2" scope="row" class="th_bg">비고</th>
                                        <td rowspan="2" class="td_input" colspan="3">
                                            <sbux-input wrap-style="height: 100%" id="dtl-inp-fcltRmrk" name="dtl-inp-fcltRmrk" uitype="text" class="form-control input-sm" group-id="group1">
                                            </sbux-input>
                                        </td>
                                        <sbux-input id="dtl-inp-gubun" name="dtl-inp-gubun" uitype="hidden" class="form-control input-sm" group-id="group1" > </sbux-input>

                                    </tr>

                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </section>
    <div id="div-rpt-clipReportPrint" style="display:none;"></div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script>
    /** 상단 grid ref Json **/
    var jsonSortPlan =[];
    var grdSortPlan;




    /** 투입유형 select **/
    var jsonInptType =[];

    /** 포장구분 select **/
    var jsonPckgSe =[];

    /** 단위 select **/
    var jsonUnit =[];

    /** 대표품목 **/
    var jsonApcItem = [];

    /** 대표품목 **/
    var jsonApcItemCd = [];

    /** 대표품종 **/
    var jsonApcVrtyCd = [];

    var planYmCheck;



    const fn_init = async function(){
    	let nowDate = new Date();
		let firstYmd = gfn_dateToYmd(nowDate);

		SBUxMethod.set("srch-dtp-planYm", firstYmd);
		planYmCheck = firstYmd;

        let result = await Promise.all([
            //gfn_setComCdSBSelect('dtl-slt-warehouseSeCd',	jsonWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('dtl-slt-inptType',	jsonInptType, 	'FCLT_GUBUN', '0000'),	// 설비유형
			gfn_setComCdSBSelect('dtl-slt-unit',	jsonUnit, 	'STD_PCKG_CD', '0000'), 			// 단위
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcItemSBSelect('dtl-inp-itemCd', 		jsonApcItemCd, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("dtl-inp-vrtyCd", 		jsonApcVrtyCd, 	gv_apcCd)			// APC 품종(저장)
        ]);
        fn_search();
    }

    const fn_search = async function(){
    	SBUxMethod.refreshGroup("group1");
    	SBUxMethod.set("dtl-inp-gubun","insert");
    	var planYm = SBUxMethod.get("srch-dtp-planYm");
    	if(planYm !== planYmCheck){
    		grdSortPlan.destroy();
    		fn_createSortListGrid();
    		planYmCehck = planYm;
    	}

        try{

            let postJsonPromise = gfn_postJSON("/am/sort/selectSortFcltOprtngPlanList.do",{apcCd:gv_apcCd, fcltType:'SORT_FCLT_CD', planYm : planYm });
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
                jsonSortPlan.length = 0;
                data.resultList.forEach((item,index) => {
                	const itemArr = jsonApcItem.find(obj => obj.itemCd === item.rprsItem);
                	var dupIndex = jsonSortPlan.findIndex(obj => obj.apcCd === item.apcCd && obj.fcltCd === item.fcltCd);
                	if(item.oprtngBgngDt !== null){
                		if (dupIndex !== -1) {
                    		var org = jsonSortPlan[dupIndex];
                        	var oprtngBgngDt = new Date(item.oprtngBgngDt);
                        	var oprtngEndDt = new Date(item.oprtngEndDt);
                        	var startDate = oprtngBgngDt.getDate();
                        	var endDate = oprtngEndDt.getDate();
                        	item["startDate"] = startDate;
                        	item["endDate"] = endDate;
                        	org["startEndDate"].push(item);

                        	for(startDate; startDate < endDate +1 ; startDate++){
                        		org[startDate.toString()] = item.oprtngBgngDt + " " + itemArr.itemNm + " # " + item.planDtlCd ;
                        		//org[startDate.toString()] = "test";
                        	}

                   		} else {
                        	var oprtngBgngDt = new Date(item.oprtngBgngDt);
                        	var oprtngEndDt = new Date(item.oprtngEndDt);
                        	var startDate = oprtngBgngDt.getDate();
                        	var endDate = oprtngEndDt.getDate();
                        	var obj = {startDate : startDate,endDate : endDate};
                        	item["startDate"] = startDate;
                        	item["endDate"] = endDate;
                        	item["startEndDate"] = [item];

                        	for(startDate; startDate < endDate +1 ; startDate++){
                        		item[startDate.toString()] = item.oprtngBgngDt + " " + itemArr.itemNm + " # " + item.planDtlCd ;
                        		//item[startDate.toString()] = "test";
                        	}
                        	jsonSortPlan.push(item);
                   		}
                	}else{
               			jsonSortPlan.push(item);
               		}




                });

                grdSortPlan.rebuild();
            }else{
                jsonSortPlan.length = 0;
                grdSortPlan.rebuild();


                const inputs = document.querySelectorAll('input[id^="dtl"]');
                inputs.forEach((item) => {
                    SBUxMethod.set(item.id, null);
                });
            }

        }catch (e){
            console.log(e);
        }
    }
    const fn_save = async function(){
    	let rowIdx = grdSortPlan.getRow();
    	let colIdx = grdSortPlan.getCol();
    	let rowData = grdSortPlan.getRowData(rowIdx);
    	let cellData = grdSortPlan.getCellData(rowIdx,colIdx);



    	let apcCd = gv_apcCd;
    	let fcltType = rowData.fcltType;
    	let fcltCd = rowData.fcltCd;
    	let oprtngBgngDt = SBUxMethod.get("dtl-dtp-bgngYmd");
    	let oprtngEndDt = SBUxMethod.get("dtl-dtp-endYmd");
    	let planDtlCd = SBUxMethod.get("dtl-inp-planNo");
    	let inptQntt = SBUxMethod.get("dtl-inp-inptQntt");
    	let inptWght = SBUxMethod.get("dtl-inp-inptWght");
    	let planQntt = SBUxMethod.get("dtl-inp-planQntt");
    	let planWght = SBUxMethod.get("dtl-inp-planWght");
    	let planRmrk = SBUxMethod.get("dtl-inp-fcltRmrk");
    	let gubun = SBUxMethod.get("dtl-inp-gubun");




        try{
            let sortFcltPlanInfo ={
            		apcCd : apcCd
            		, fcltType : fcltType
            		, fcltCd : fcltCd
            		, oprtngBgngDt : oprtngBgngDt
            		, oprtngEndDt : oprtngEndDt
            		, planDtlCd : planDtlCd
            		, inptQntt : inptQntt
            		, inptWght : inptWght
            		, planQntt : planQntt
            		, planWght : planWght
            		, planRmrk : planRmrk
            		, status : cellData.length > 0 ? "2": "3"
            		, orgOprtngBgngDt : cellData.length > 0 ? cellData.split(" ")[0].replaceAll("-","") : ""
            		, gubun : gubun
            		};
            //let sortFcltDtlData = grdSortFcltDtlList.getGridDataAll();



            let postJsonPromise = gfn_postJSON("/am/sort/insertSortFcltOprtngPlan.do",sortFcltPlanInfo);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    fn_search();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
    }

    const fn_delete = async function(){


        let rowidx = grdSortPlan.getRow();
        let colidx = grdSortPlan.getCol();
        if(rowidx == -1){
        	return;
        }

        let vo = grdSortPlan.getRowData(rowidx);
        let cellData = grdSortPlan.getCellData(rowidx,colidx);
        let planVO = {
        		apcCd : vo.apcCd
        		, fcltCd : vo.fcltCd
        		, oprtngBgngDt : cellData.split(" ")[0].replaceAll("-","")
        		, fcltType : 'SORT_FCLT_CD'
        }
        let postJsonPromise = gfn_postJSON("/am/sort/deleteSortFcltOprtngPlan.do",planVO);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
               gfn_comAlert("I0001");
               fn_search();
            };
        }catch (e){
            console.error(e);
        }
    }


    /** 상단 목록 grid create **/
    const fn_createSortListGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSortPlan';
        SBGridProperties.id = 'grdSortPlan';
        SBGridProperties.jsonref = 'jsonSortPlan';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.mergecells = 'byrow';
        SBGridProperties.columns = columnData();
        grdSortPlan = _SBGrid.create(SBGridProperties);

        grdSortPlan.bind('afterrebuild','gridAfterRebuild');
        grdSortPlan.bind('click','fn_grdSortPlanDataBind');


    }
	const fn_grdSortPlanDataBind = function(){
		let rowIdx = grdSortPlan.getRow();
		let colIdx = grdSortPlan.getCol();
		let row = grdSortPlan.getRowData(rowIdx);
		let rowData = row.startEndDate.find(obj => obj.startDate === colIdx);
		if(gfn_nvl(rowData) === ""){
			SBUxMethod.refreshGroup("group1");
			SBUxMethod.set("dtl-inp-gubun","insert");
			return;
		}


		SBUxMethod.set("dtl-inp-itemCd",rowData.rprsItem);
		SBUxMethod.refresh("dtl-inp-vrtyCd");
		SBUxMethod.set("dtl-inp-vrtyCd",rowData.rprsVrty);
		SBUxMethod.set("dtl-inp-planNo",rowData.planDtlCd);
		SBUxMethod.set("dtl-inp-inptQntt",rowData.inptQntt);
		SBUxMethod.set("dtl-inp-inptWght",rowData.inptWght);
		SBUxMethod.set("dtl-inp-planQntt",rowData.planQntt);
		SBUxMethod.set("dtl-inp-planWght",rowData.planWght);
		SBUxMethod.set("dtl-dtp-bgngYmd",rowData.oprtngBgngDt);
		SBUxMethod.set("dtl-dtp-endYmd",rowData.oprtngEndDt);
		SBUxMethod.set("dtl-inp-fcltRmrk",rowData.planRmrk);
		SBUxMethod.set("dtl-inp-gubun","update");


	}
    const gridAfterRebuild = function(){
		let allData = grdSortPlan.getGridDataAll();
		allData.forEach((item,index) => {
			if(item.hasOwnProperty('startEndDate')){
				item.startEndDate.forEach((item)=>{
					var startDate = item.startDate;
					var endDate = item.endDate;
					grdSortPlan.setCellStyle('background-color', index+2, startDate, index+2, endDate, '#e3dde3');
				});
			}
		});
	}



    /**
     * @name fn_dtpChange
     * @description 입고일자 from to validation
     * @function
     */
    const fn_dtpChange = function(_targetId){
        let yyyy = _targetId.substring(0,4);
        let mm = _targetId.substring(4,6);
        let lastDay = new Date(yyyy,parseInt(mm), 0).getDate();
		let startDay = yyyy + '/' + mm + '/01';
		let endDay = yyyy + '/' + mm + '/' + lastDay.toString();
        SBUxMethod.setDatepickerMinDate('dtl-dtp-bgngYmd',startDay );
        SBUxMethod.setDatepickerMaxDate('dtl-dtp-bgngYmd',endDay);

        SBUxMethod.setDatepickerMinDate('dtl-dtp-endYmd',startDay );
        SBUxMethod.setDatepickerMaxDate('dtl-dtp-endYmd',endDay);
    }

    const fn_dtpValidate = function(){
    	let bgngYmd = SBUxMethod.get("dtl-dtp-bgngYmd");
    	let endYmd = SBUxMethod.get("dtl-dtp-endYmd");

    	if(gfn_nvl(bgngYmd) === "" || gfn_nvl(endYmd) === ""){
    		return;
    	}

    	if(bgngYmd > endYmd){
        	SBUxMethod.refresh("dtl-dtp-endYmd");
        	alert("시작일자보다 날짜가 이릅니다");
    	}

    }

    const columnData = function(){
    	let columnsData = [];
    	let planYm = SBUxMethod.get("srch-dtp-planYm");


    	let topColumn = {caption: ['선별기','선별기'], ref: 'fcltNm', width: '20%', type: 'output', style:'text-align:center'};
        columnsData.push(topColumn);
        for(var i = 1; i<32 ; i++){
        	var column = {width: '2.5%', type: 'output', style:'text-align:center'}
        	column['caption'] = [planYm,i.toString()];
        	column['ref'] = i.toString();
        	columnsData.push(column);
        }
        return columnsData;

	}


    function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");

	}

	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);

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
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNms.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
	}



    window.addEventListener("DOMContentLoaded",function(){


        fn_init();
        fn_createSortListGrid();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
