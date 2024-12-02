<%
 /**
  * @Class Name : pckgFcltInfoMng.jsp
  * @Description : 포장설비정보관리 화면
  * @author SI개발부
  * @since 2024.07.01
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.07.01   	박승진			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 포장설비정보관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 포장설비정보관리 -->
				</div>
				<div style="margin-left: auto;">


					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                    <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelectAll.jsp" %>
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>포장기</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-select
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									id="srch-slt-pckgFcltCd"
									name="srch-slt-pckgFcltCd"
									uitype="single"
									jsondata-ref="jsonPckgFcltInfo"
									unselected-text="전체"
								></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">

					<div class="ad_tbl_top"  >
						<ul class="ad_tbl_count">
							<li><span>▶포장기목록</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdPckgFcltList" style="width:100%;height:300px;"></div>
					</div>
				</div>

					<div class="row">
						<div class="col-sm-7">
							<div class="ad_tbl_top2">
								<ul class="ad_tbl_count">
									<li><span>▶상세정보</span></li>
								</ul>
							</div>
							<div>
								<table class="table table-bordered tbl_fixed">
									<colgroup>
										<col style="width: 20%">
										<col style="width: 30%">
										<col style="width: 20%">
										<col style="width: 30%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="th_bg">설비코드</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-fcltCd" name="dtl-inp-fcltCd" uitype="text" class="form-control input-sm"  group-id="group1" disabled></sbux-input>
											</td>
											<th scope="row" class="th_bg">설비명</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-fcltNm" name="dtl-inp-fcltNm" uitype="text" class="form-control input-sm" required style="width:100%"  group-id="group1" disabled></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg">설비유형</th>
											<td class="td_input">
												<sbux-select
                                                    id="dtl-slt-fcltType"
                                                    name="dtl-slt-fcltType"
                                                    uitype="single"
                                                    jsondata-ref="jsonFcltType"
                                                    unselected-text="전체"
                                                    class="form-control input-sm input-sm-ast"
                                                    group-id="group1"
                                                    disabled
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
												<sbux-input id="dtl-inp-pckgFcltExpln" name="dtl-inp-pckgFcltExpln" class="form-control input-sm" uitype="text" required style="width:100%" group-id="group1" ></sbux-input>
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
                                        <td class="td_input">
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
											<th scope="row" class="th_bg">포장Capa</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-pckgCapa" name="dtl-inp-pckgCapa" uitype="text" class="form-control input-sm" group-id="group1"></sbux-input>
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
											<th scope="row" class="th_bg">비고</th>
											<td colspan="3" class="td_input">
												<sbux-textarea id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="normal" rows="2" class="form-control" group-id="group1"></sbux-input>
											</td>
										</tr>
									</thead>
								</table>
							</div>
						</div>

						<div class="col-sm-5">
							<div class="ad_tbl_top2"  >
								<ul class="ad_tbl_count">
									<li><span>▶상세정보</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdPckgFcltDtl" style="width:100%;height:280px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>









	</section>


<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {

	}
	async function cfn_add() {
		await fn_create();
	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}
	let lv_prvAuthrtId = "";
	let lv_prvMenuId = "";

	/* 공통코드 */
	var jsonComSysId 		= [];	// 시스템유형	srch-slt-sysId		SYS_ID
    var jsonComAuthrtType 	= [];	// 권한유형	dtl-slt-authrtType	AUTHRT_TYPE
	var jsonAplcnType		= [];	// 적용유형	APLCN_TYPE

    /* SBGrid */
    var grdPckgFcltList;			// 포장기목록
    var grdPckgFcltDtl;		// 상세정보


    /* SBGrid Data (JSON) */
    var jsonPckgFcltInfo = [];
    var jsonPckgFcltType = [];
    var jsonPckgSeCd = [];
    var jsonpckgDtlType = [];
    var jsonFcltType = [];

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

    var jsonPckgFcltList = [];
    var jsonPckgFcltDtlList = [];

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrdPckgFcltList();
		fn_createGrdPckgFcltDtl();
		fn_init();
	});

    /**
     * @name fn_init
     * @description initialize Form
     * @function
     */
	const fn_init = async function() {

		let result = await Promise.all([
            //gfn_setComCdSBSelect('dtl-slt-warehouseSeCd',	jsonWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('dtl-slt-fcltType',	jsonFcltType, 	'FCLT_GUBUN', '0000'),	// 설비유형
			gfn_setComCdSBSelect('dtl-slt-unit',	jsonUnit, 	'STD_PCKG_CD', '0000'), 			// 단위
			gfn_setComCdSBSelect('srch-slt-pckgFcltCd',	jsonPckgFcltInfo, 	'PCKG_FCLT_CD', gv_selectedApcCd), 			// 선별기
			gfn_setApcItemSBSelect('dtl-inp-rprsItem', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("dtl-inp-rprsVrty", 		jsonApcVrty, 	gv_apcCd)			// APC 품종(저장)
        ]);

	}

    /**
     * @name fn_initSBSelect
     * @description SBSelect 초기화
     * @function
     */
    const fn_initSBSelect = async function() {

    	let rst = await Promise.all([
    		// 조회 SB select
    	 	//gfn_setComCdSBSelect('srch-slt-sysId', jsonComSysId, 'SYS_ID'),	// 시스템유형
    	 	// 상세 SB select
    	 	//gfn_setComCdSBSelect('dtl-slt-authrtType', jsonComAuthrtType, 'AUTHRT_TYPE'),	// 권한유형
    	 	//fn_initComCd();
    	]);

    }



    /**
     * @name fn_createGrdPckgFcltList
     * @description 포장기 목록
     * @function
     */
    const fn_createGrdPckgFcltList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgFcltList';
	    SBGridProperties.id = 'grdPckgFcltList';
	    SBGridProperties.jsonref = 'jsonPckgFcltList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"],			ref: 'fcltCd',		type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["명칭"],			ref: 'fcltNm',    	type:'output',  width:'40%',    style:'text-align:center'},
            {caption: ["설명"],			ref: 'rmrk',			type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["연계코드"],	ref: 'lnkgCd',    	type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["권한설명"],	ref: 'test',        	type:'output',  hidden: true},

        ];

        grdPckgFcltList = _SBGrid.create(SBGridProperties);
        grdPckgFcltList.bind('click','fn_selectPckgFcltDtlInfo');
    }


    /**
     * @name fn_createGrdPckgFcltDtl
     * @description 포장기 상세정보
     * @function
     */
    const fn_createGrdPckgFcltDtl = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgFcltDtl';
	    SBGridProperties.id = 'grdPckgFcltDtl';
	    SBGridProperties.jsonref = 'jsonPckgFcltDtlList';
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

        ];

        grdPckgFcltDtl = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {

        const editableRow = grdPckgFcltDtl.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.delYn = "N";
        editableRow.gubun = "insert";

        grdPckgFcltDtl.rebuild();
        grdPckgFcltDtl.addRow(true);
        grdPckgFcltDtl.addStatus(nRow,"insert");
        nRow++;
        grdPckgFcltDtl.setCellDisabled(nRow, 0, nRow, grdPckgFcltDtl.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(nRow) {
        let rowIndex = grdPckgFcltDtl.getRow();
        let status = grdPckgFcltDtl.getRowStatus(rowIndex);
        if(status === 0){
        	fn_deleteDtl(rowIndex);
        }else{
        	grdPckgFcltDtl.deleteRow(nRow);
        }
    }

     const fn_deleteDtl = async function(rowIndex){

         if(!gfn_comConfirm("Q0001","삭제")){
             return;
         };

         let rowData = grdPckgFcltDtl.getRowData(rowIndex);
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



    const fn_search = async function(){
    	SBUxMethod.refreshGroup("group1");
    	jsonPckgFcltDtlList.length = 0;
    	grdPckgFcltDtl.refresh();
		let sortFcltCd = SBUxMethod.get("srch-slt-pckgFcltCd");
    	let condition = {
    		apcCd:gv_apcCd
    		, fcltCd : sortFcltCd
    		, fcltType : "PCKG_FCLT_CD"
    	}

        try{
            let postJsonPromise = gfn_postJSON("/am/sort/selectSortFcltInfoList.do",condition);
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
                jsonPckgFcltList.length = 0;
                data.resultList.forEach((item) => {
                    jsonPckgFcltList.push(item);
                });
                grdPckgFcltList.rebuild();
            }else{
                jsonPckgFcltList.length = 0;
                grdPckgFcltList.rebuild();
                jsonPckgFcltDtlList.length = 0;
                grdPckgFcltDtl.rebuild();

                let nRow = grdPckgFcltDtl.getRows();
                grdPckgFcltDtl.addRow(true);
                grdPckgFcltDtl.setCellDisabled(nRow, 0, nRow, grdPckgFcltDtl.getCols() - 1, true);
            }

        }catch (e){
            console.log(e);
        }
    }

    const fn_save = async function(){
    	let rowData = grdPckgFcltList.getRowData(grdPckgFcltList.getRow());
    	let fcltCd = SBUxMethod.get("dtl-inp-fcltCd");
    	let fcltNm = SBUxMethod.get("dtl-inp-fcltNm");
		let fcltExpln = SBUxMethod.get("dtl-inp-pckgFcltExpln"); // 설명
		let cpctUnit = SBUxMethod.get("dtl-inp-pckgCapa");
		let fcltRmrk = SBUxMethod.get("dtl-inp-rmrk"); //비고
		let rprsItem = SBUxMethod.get("dtl-inp-rprsItem");
		let rprsVrty = SBUxMethod.get("dtl-inp-rprsVrty");
		let unit = SBUxMethod.get("dtl-slt-unit");
		let oprtngHr = SBUxMethod.get("dtl-dtp-oprtngHr");
		let noprtngHr = SBUxMethod.get("dtl-dtp-noprtngHr");
		//let bgngYmd = SBUxMethod.get("dtl-dtp-bgngYmd");
		//let endYmd = SBUxMethod.get("dtl-dtp-endYmd");





        try{
            let pckgFcltInfo ={
            			apcCd : gv_apcCd
            			, fcltType : "PCKG_FCLT_CD"
            			, fcltCd : fcltCd
            			, atrbCd : fcltCd
            			, atrbVl : ""
            			, rprsItem : rprsItem
            			, rprsVrty : rprsVrty
            			, cpctUnit : cpctUnit
            			, unit   : unit
            			, oprtngHr : oprtngHr
            			, noprtngHr : noprtngHr
            			, bgngYmd  : ""
            			, endYmd  : ""
            			, sn     : "0"
            			, fcltRmrk : fcltRmrk
            			, fcltNm  : fcltNm
            			, fcltExpln	: fcltExpln
            	//		, atrbIndctNm : rowData.IndctNm
            		};

			let sortFcltDtl = grdPckgFcltDtl.getGridDataAll();
				sortFcltDtl.forEach((item,sn) => {
					if(gfn_nvl(item.gubun) === ""){
						item.gubun = "update";
					}
					delete item.itemCd;
					item["status"] = grdPckgFcltDtl.getRowStatus(sn+1)
					Object.assign(item,pckgFcltInfo);
				});


            let pckgFcltDtlList = sortFcltDtl.filter(x => x.delYn==="N");

            let postJsonPromise = gfn_postJSON("/am/sort/insertSortFclt.do",[pckgFcltInfo,pckgFcltDtlList]);

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

    /**
     * @name fn_selectPckgFcltDtlInfo
     * @description 상단 그리드 click event => 상세 목록 조회
     * @function
     */
    const fn_selectPckgFcltDtlInfo = async function(){

        let rowIdx = grdPckgFcltList.getRow();
        let pckgFcltVO = grdPckgFcltList.getRowData(rowIdx);
        if(gfn_isEmpty(pckgFcltVO)){
            return;
        }

        pckgFcltVO.apcCd = gv_apcCd;
		SBUxMethod.set("dtl-inp-fcltCd",gfn_nvl(pckgFcltVO.fcltCd));
		SBUxMethod.set("dtl-inp-fcltNm",gfn_nvl(pckgFcltVO.fcltNm));
		SBUxMethod.set("dtl-inp-pckgFcltExpln",gfn_nvl(pckgFcltVO.fcltExpln));
		SBUxMethod.set("dtl-inp-pckgCapa",gfn_nvl(pckgFcltVO.cpctUnit));
		SBUxMethod.set("dtl-inp-rmrk",gfn_nvl(pckgFcltVO.fcltRmrk));
		SBUxMethod.set("dtl-inp-rprsItem",gfn_nvl(pckgFcltVO.rprsItem));
		SBUxMethod.set("dtl-inp-rprsVrty",gfn_nvl(pckgFcltVO.rprsVrty));
		SBUxMethod.set("dtl-slt-unit",gfn_nvl(pckgFcltVO.unit));
		SBUxMethod.set("dtl-dtp-oprtngHr",gfn_nvl(pckgFcltVO.oprtngHr));
		SBUxMethod.set("dtl-dtp-noprtngHr",gfn_nvl(pckgFcltVO.noprtngHr));
		SBUxMethod.set("dtl-dtp-bgngYmd",gfn_nvl(pckgFcltVO.bgngYmd));
		SBUxMethod.set("dtl-dtp-endYmd",gfn_nvl(pckgFcltVO.endYmd));
		SBUxMethod.set("dtl-slt-fcltType",gfn_nvl(pckgFcltVO.fcltType));


		pckgFcltVO['fcltType'] = 'PCKG_FCLT_CD';

        let postJsonPromise = gfn_postJSON("/am/sort/selectSortFcltDtl.do",pckgFcltVO);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.resultList.length >= 0){


                	jsonPckgFcltDtlList.length = 0;
                	jsonPckgFcltDtlList = data.resultList;
                    grdPckgFcltDtl.rebuild();

                    let nRow = grdPckgFcltDtl.getRows();
                    grdPckgFcltDtl.addRow(true);
                    grdPckgFcltDtl.setCellDisabled(nRow, 0, nRow, grdPckgFcltDtl.getCols() - 1, true);
                }
            }
        }catch (e){
            console.error();
        }

    }







</script>
</body>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>