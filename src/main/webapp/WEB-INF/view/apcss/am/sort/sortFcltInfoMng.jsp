<%
    /**
     * @Class Name : sortFcltInfoMng.jsp
     * @Description : 선별 설비 정보 관리 화면
     * @author SI개발부
     * @since 2024.09.03
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.09.03   	박승진		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 선별 설비 정보 관리</title>
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
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별설비정보관리 -->
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
							<th scope="row" class="th_bg">선별기</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-sortFcltCd"
									name="srch-slt-sortFcltCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonSortFclt"
								></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>선별기 목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdSortFcltList"></div>
                    </div>
                    <div style="display: flex;gap: 3vw">
                        <div style="flex: 1.6">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>선별기 기본정보</span>
                                    </li>
                                    <li id="createFlag"style="display: none">
                                        <span style="color: red">신규생성중</span>
                                    </li>
                                    <li id="editFlag"style="display: none">
                                        <span style="color: red">수정중</span>
                                    </li>
                                </ul>
                            </div>
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
                                        <th scope="row" class="th_bg">설비코드</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-fcltCd" name="dtl-inp-fcltCd" uitype="text" class="form-control input-sm" group-id="group1" disabled>
                                            </sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">명칭</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-alias" name="dtl-inp-alias" uitype="text" class="form-control input-sm" group-id="group1" disabled>
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">설비유형</th>
                                        <td class="td_input" >
                                            <sbux-select
                                                    id="dtl-slt-fcltType"
                                                    name="dtl-slt-fcltType"
                                                    uitype="single"
                                                    jsondata-ref="jsonFcltType"
                                                    unselected-text="전체"
                                                    class="form-control input-sm input-sm-ast"
                                                    group-id="group1"
                                            ></sbux-select>
                                        </td>
                                        <th scope="row" class="th_bg">포장구분</th>
                                        <td class="td_input">
                                            <sbux-select
                                                    id="dtl-slt-pckgSe"
                                                    name="dtl-slt-pckgSe"
                                                    uitype="single"
                                                    jsondata-ref="jsonPckgSe"
                                                    unselected-text="전체"
                                                    class="form-control input-sm input-sm-ast"
                                                    group-id="group1"
                                            ></sbux-select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">설명</th>
                                        <td class="td_input" colspan="3">
                                            <sbux-input id="dtl-inp-expln" name="dtl-inp-expln" uitype="text" class="form-control input-sm" group-id="group1">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">대표품목</th>
                                        <td class="td_input">
                                            <sbux-select
                                            	id="dtl-inp-rprsItem"
                                            	name="dtl-inp-rprsItem"
                                            	uitype="single"
                                                jsondata-ref="jsonApcItem"
                                                class="form-control input-sm"
                                                group-id="group1">
                                            </sbux-select>
                                        </td>
                                        <th scope="row" class="th_bg">대표품종</th>
                                        <td>
                                        	<sbux-select
                                        		id="dtl-inp-rprsVrty"
                                        		name="dtl-inp-rprsVrty"
                                        		uitype="single"
                                                jsondata-ref="jsonApcVrty"
                                                filter-source-name="dtl-inp-rprsItem"
                                                jsondata-filter = "itemCd"
                                        		class="form-control input-sm"
                                        		group-id="group1">
                                            </sbux-select>
										</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">선별Capa</th>
                                        <td class="td_input">
                                        	<sbux-input id="dtl-inp-sortCapa" name="dtl-inp-sortCapa" uitype="text" class="form-control input-sm" permit-keycodes-set="num" exclude-kr="kr" group-id="group1">
                                            </sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">단위</th>
                                        <td class="td_input">
                                        	<sbux-select
                                                    id="dtl-slt-unit"
                                                    name="dtl-slt-unit"
                                                    uitype="single"
                                                    jsondata-ref="jsonUnit"
                                                    unselected-text="전체"
                                                    class="form-control input-sm input-sm-ast"
                                                    group-id="group1"
                                            ></sbux-select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">가동시간</th>
                                        <td class="td_input">
                                            <sbux-datepicker
                                            		id="dtl-dtp-oprtngHr"
                                            		name="dtl-dtp-oprtngHr"
                                            		uitype="popup"
                                            		date-format="yyyy/mm/dd HH:MM"
													show-time-bar="true"
													class="form-control input-sm sbux-pik-group-apc input-sm-ast"
													group-id="group1">

                                    		</sbux-datepicker>
                                        </td>
                                        <th scope="row" class="th_bg">비가동시간</th>
                                        <td class="td_input">
                                           <sbux-datepicker
                                           		id="dtl-dtp-noprtngHr"
                                           		name="dtl-dtp-noprtngHr"
                                           		uitype="popup"
												date-format="yyyy/mm/dd HH:MM"
												show-time-bar="true"
												class="form-control input-sm sbux-pik-group-apc input-sm-ast"
												group-id="group1">
											</sbux-datepicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">시작일자</th>
                                        <td class="td_input">
                                            <sbux-datepicker
                                            		id="dtl-dtp-bgngYmd"
                                         			name="dtl-dtp-bgngYmd"
                                         			uitype="popup"
                                         			date-format="yyyy-mm-dd"
                                         			class="form-control input-sm input-sm-ast sbux-pik-group-apc"
                                         			group-id="group1">
                                      		</sbux-datepicker>
                                        </td>
                                        <th scope="row" class="th_bg">종료일자</th>
                                        <td class="td_input">
                                            <sbux-datepicker
                                            		id="dtl-dtp-endYmd"
                                            		name="dtl-dtp-endYmd"
                                            		uitype="popup"
                                            		date-format="yyyy-mm-dd"
                                            		class="form-control input-sm input-sm-ast sbux-pik-group-apc"
                                            		group-id="group1" >
                                           	</sbux-datepicker>
                                        </td>
                                    </tr>
                                    <tr style="height: 5vh">
                                        <th rowspan="2" scope="row" class="th_bg">비고</th>
                                        <td rowspan="2" class="td_input" colspan="3">
                                            <sbux-input wrap-style="height: 100%" id="dtl-inp-fcltRmrk" name="dtl-inp-fcltRmrk" uitype="text" class="form-control input-sm" group-id="group1">
                                            </sbux-input>
                                        </td>
                                    </tr>

                                </tbody>

                            </table>
                        </div>
                        <div style="flex: 1;display: flex;flex-direction: column;">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>상세정보</span>
                                    </li>
                                </ul>
                            </div>
                            <div id="sb-area-grdSortFcltDtlList" style="flex: 1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div-rpt-clipReportPrint" style="display:none;"></div>
    </section>
</body>
<script>
    /** 상단 grid ref Json **/
    var jsonSortFcltList =[];
    var grdSortFcltList;
    /** 하단 grid ref Json **/
    var jsonSortFcltDtlList =[];
    var grdSortFcltDtlList;




    /** 설비유형 select **/
    var jsonFcltType =[];

    /** 포장구분 select **/
    var jsonPckgSe =[];

    /** 단위 select **/
    var jsonUnit =[];

    /** 대표품목 **/
    var jsonApcItem = [];

    /** 대표품종 **/
    var jsonApcVrty = [];

    var comboData = [{label : 'Y', value : 'Y'},{label : 'N', value : 'N'}];

    /** 선별기 검색조건**/
    var jsonSortFclt = [];



    const fn_init = async function(){



        let result = await Promise.all([
            //gfn_setComCdSBSelect('dtl-slt-warehouseSeCd',	jsonWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('dtl-slt-fcltType',	jsonFcltType, 	'FCLT_GUBUN', '0000'),	// 설비유형
			gfn_setComCdSBSelect('dtl-slt-unit',	jsonUnit, 	'STD_PCKG_CD', '0000'), 			// 단위
			gfn_setComCdSBSelect('srch-slt-sortFcltCd',	jsonSortFclt, 	'SORT_FCLT_CD', gv_selectedApcCd), 			// 선별기
			gfn_setApcItemSBSelect('dtl-inp-rprsItem', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("dtl-inp-rprsVrty", 		jsonApcVrty, 	gv_apcCd)			// APC 품종(저장)
        ]);
    }

    const fn_search = async function(){
    	SBUxMethod.refreshGroup("group1");
    	jsonSortFcltDtlList.length = 0;
    	grdSortFcltDtlList.refresh();
		let sortFcltCd = SBUxMethod.get("srch-slt-sortFcltCd");
    	let condition = {
    		apcCd:gv_apcCd
    		, fcltCd : sortFcltCd
    		, fcltType : "SORT_FCLT_CD"
    	}

        try{
            let postJsonPromise = gfn_postJSON("/am/sort/selectSortFcltInfoList.do",condition);
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
                jsonSortFcltList.length = 0;
                data.resultList.forEach((item) => {
                    jsonSortFcltList.push(item);
                });
                grdSortFcltList.rebuild();
            }else{
                jsonSortFcltList.length = 0;
                grdSortFcltList.rebuild();
                jsonSortFcltDtlList.length = 0;
                grdSortFcltDtlList.rebuild();

                let nRow = grdSortFcltDtlList.getRows();
                grdSortFcltDtlList.addRow(true);
                grdSortFcltDtlList.setCellDisabled(nRow, 0, nRow, grdSortFcltDtlList.getCols() - 1, true);
            }

        }catch (e){
            console.log(e);
        }
    }

    const fn_save = async function(){
    	let rowData = grdSortFcltList.getRowData(grdSortFcltList.getRow());
    	//let rowDtlData = grdSortFcltDtlList.getRowData(grdSortFcltDtlList.getRowData);
    	let fcltCd = SBUxMethod.get("dtl-inp-fcltCd");
		let fcltExpln = SBUxMethod.get("dtl-inp-expln"); // 설명
		let cpctUnit = SBUxMethod.get("dtl-inp-sortCapa");
		let fcltRmrk = SBUxMethod.get("dtl-inp-fcltRmrk"); //비고
		let rprsItem = SBUxMethod.get("dtl-inp-rprsItem");
		let rprsVrty = SBUxMethod.get("dtl-inp-rprsVrty");
		let unit = SBUxMethod.get("dtl-slt-unit");
		let oprtngHr = SBUxMethod.get("dtl-dtp-oprtngHr");
		let noprtngHr = SBUxMethod.get("dtl-dtp-noprtngHr");
		let bgngYmd = SBUxMethod.get("dtl-dtp-bgngYmd");
		let endYmd = SBUxMethod.get("dtl-dtp-endYmd");
		let fcltNm = SBUxMethod.get("dtl-inp-alias");




        try{
            let sortFcltInfo ={
            			apcCd : gv_apcCd
            			, fcltType : "SORT_FCLT_CD"
            			, fcltCd : fcltCd
            			, atrbCd : fcltCd
            			, atrbVl : ""
            			, rprsItem : rprsItem
            			, rprsVrty : rprsVrty
            			, cpctUnit : cpctUnit
            			, unit   : unit
            			, oprtngHr : oprtngHr
            			, noprtngHr : noprtngHr
            			, bgngYmd  : bgngYmd
            			, endYmd  : endYmd
            			, sn     : "0"
            			, fcltRmrk : fcltRmrk
            			, fcltNm  : fcltNm
            			, fcltExpln	: fcltExpln
            	//		, atrbIndctNm : rowData.IndctNm
            		};

			let sortFcltDtl = grdSortFcltDtlList.getGridDataAll();
				sortFcltDtl.forEach((item,sn) => {
					if(gfn_nvl(item.gubun) === ""){
						item.gubun = "update";
					}
					delete item.itemCd;
					item["status"] = grdSortFcltDtlList.getRowStatus(sn+1)
					Object.assign(item,sortFcltInfo);
				});


            let sortFcltDtlList = sortFcltDtl.filter(x => x.delYn==="N");

            let postJsonPromise = gfn_postJSON("/am/sort/insertSortFclt.do",[sortFcltInfo,sortFcltDtlList]);

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

    const fn_delete = async function(){

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let idx = grdSortFcltList.getRow();
        let sortFcltVO = grdSortFcltList.getRowData(idx);
        let postJsonPromise = gfn_postJSON("/am/sort/deleteSortFclt.do",sortFcltVO);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                    gfn_comAlert("I0001");
                    fn_search();
                }
            };
        }catch (e){
            console.error(e);
        }
    }

    const fn_deleteDtl = async function(rowIndex){

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let rowData = grdSortFcltDtlList.getRowData(rowIndex);
        let postJsonPromise = gfn_postJSON("/am/sort/deleteSortFcltDtl.do",rowData);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                    gfn_comAlert("I0001");
                }
            };
        }catch (e){
            console.error(e);
        }
    }


    /** 상단 목록 grid create **/
    const fn_createSortListGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSortFcltList';
        SBGridProperties.id = 'grdSortFcltList';
        SBGridProperties.jsonref = 'jsonSortFcltList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
            {caption: ['코드'], ref: 'fcltCd', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['명칭'], ref: 'fcltNm', width: '30%', type: 'output', style:'text-align:center'},
            {caption: ['설명'], ref: 'fcltExpln', width: '40%', type: 'output', style:'text-align:center'},
            {caption: ['연계코드'], ref: 'extrnlLnkgCd', width: '20%', type: 'output', style:'text-align:center'},
        ]
        grdSortFcltList = _SBGrid.create(SBGridProperties);
        grdSortFcltList.bind('click','fn_selectSortFcltDtlInfo');
    }
    /** 하단 우측 grid create **/
    const fn_createSortFcltDtlList = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSortFcltDtlList';
        SBGridProperties.id = 'grdSortFcltDtlList';
        SBGridProperties.jsonref = 'jsonSortFcltDtlList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["처리"], 		ref: 'itemCd', 		type:'button', width:'10%', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ['상세 유형'], ref: 'fcltDtlType', width: '33%', type: 'input', style:'text-align:center'},
            {caption: ['상세 수치'], ref: 'dtlVl', width: '24%', type: 'input', style:'text-align:center'},
            {caption: ['상세 코드'], ref: 'dtlCd', width: '33%', type: 'input', style:'text-align:center'},
        ]
        grdSortFcltDtlList = _SBGrid.create(SBGridProperties);

        let nRow = grdSortFcltDtlList.getRows();
        grdSortFcltDtlList.addRow(true);
        grdSortFcltDtlList.setCellDisabled(nRow, 0, nRow, grdSortFcltDtlList.getCols() - 1, true);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {

        const editableRow = grdSortFcltDtlList.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.delYn = "N";
        editableRow.gubun = "insert";

        grdSortFcltDtlList.rebuild();
        grdSortFcltDtlList.addRow(true);
        grdSortFcltDtlList.addStatus(nRow,"insert");
        nRow++;
        grdSortFcltDtlList.setCellDisabled(nRow, 0, nRow, grdSortFcltDtlList.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(nRow) {
        let rowIndex = grdSortFcltDtlList.getRow();
        let status = grdSortFcltDtlList.getRowStatus(rowIndex);
        if(status === 0){
        	fn_deleteDtl(rowIndex);
        }else{
        	grdSortFcltDtlList.deleteRow(nRow);
        }
    }

    /**
     * @name fn_dtpChange
     * @description 입고일자 from to validation
     * @function
     */
    const fn_dtpChange = function(_targetId){
        let wrhsYmdFrom = SBUxMethod.get("dtl-dtp-bgngYmd");
        let wrhsYmdTo = SBUxMethod.get("dtl-dtp-endYmd");
        let newValue = 0;
        if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
            gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
            if(_targetId.id == 'dtl-dtp-bgngYmd'){
                 newValue = wrhsYmdTo - 1;
            }else{
                 newValue = parseInt(wrhsYmdFrom) + 1;
            }
            SBUxMethod.set(_targetId.id, String(newValue));
            return;
        }
    }

    /**
     * @name fn_selectWghInfo
     * @description 상단 그리드 click event => 상세 목록 조회
     * @function
     */
    const fn_selectSortFcltDtlInfo = async function(){

        let rowIdx = grdSortFcltList.getRow();
        let sortFcltVO = grdSortFcltList.getRowData(rowIdx);
        if(gfn_isEmpty(sortFcltVO)){
            return;
        }
        sortFcltVO.apcCd = gv_apcCd;
		SBUxMethod.set("dtl-inp-fcltCd",sortFcltVO.fcltCd);
		SBUxMethod.set("dtl-inp-expln",sortFcltVO.fcltExpln);
		SBUxMethod.set("dtl-inp-sortCapa",sortFcltVO.cpctUnit);
		SBUxMethod.set("dtl-inp-fcltRmrk",sortFcltVO.fcltRmrk);
		SBUxMethod.set("dtl-inp-rprsItem",sortFcltVO.rprsItem);
		SBUxMethod.set("dtl-inp-rprsVrty",sortFcltVO.rprsVrty);
		SBUxMethod.set("dtl-slt-unit",sortFcltVO.unit);
		SBUxMethod.set("dtl-dtp-oprtngHr",sortFcltVO.oprtngHr);
		SBUxMethod.set("dtl-dtp-noprtngHr",sortFcltVO.noprtngHr);
		SBUxMethod.set("dtl-dtp-bgngYmd",sortFcltVO.bgngYmd);
		SBUxMethod.set("dtl-dtp-endYmd",sortFcltVO.endYmd);
		SBUxMethod.set("dtl-inp-alias",sortFcltVO.fcltNm);

		sortFcltVO['fcltType'] = 'SORT_FCLT_CD';

        let postJsonPromise = gfn_postJSON("/am/sort/selectSortFcltDtl.do",sortFcltVO);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.resultList.length >= 0){


                    jsonSortFcltDtlList.length = 0;
                    jsonSortFcltDtlList = data.resultList;
                    grdSortFcltDtlList.rebuild();

                    let nRow = grdSortFcltDtlList.getRows();
                    grdSortFcltDtlList.addRow(true);
                    grdSortFcltDtlList.setCellDisabled(nRow, 0, nRow, grdSortFcltDtlList.getCols() - 1, true);
                }
            }
        }catch (e){
            console.error();
        }

    }


    window.addEventListener("DOMContentLoaded",function(){
    	fn_createSortListGrid();
        fn_createSortFcltDtlList();
        fn_search();
        fn_init();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
