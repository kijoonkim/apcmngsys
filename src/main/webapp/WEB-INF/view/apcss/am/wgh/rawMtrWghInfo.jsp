<%
    /**
     * @Class Name : rawMtrWghInfo.jsp
     * @Description : 원물계량대정보조회
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
    <title>title : 원물계량정보조회</title>
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
                    <sbux-button
                            id="btnSearch"
                            name="btnSearch"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            text="조회"
                            onclick="fn_search"
                    ></sbux-button>
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
							<th scope="row" class="th_bg">계량대</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-wghFcltCd"
									name="srch-slt-wghFcltCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonWghFclt"
                                    jsondata-value="cdVl"
                                    jsondata-text="cdVlNm"
									style="width:80%"
								></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>계량대 목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdRawMtrWghList" style="height:550px"></div>
                    </div>

                </div>
            </div>
        </div>
        <div id="div-rpt-clipReportPrint" style="display:none;"></div>
    </section>
</body>
<script>
    /** 상단 grid ref Json **/
    /** 하단 grid ref Json **/
    var jsonWghFcltDtlList =[];
    var grdWghFcltDtlList;

    /** 설비유형 select **/
    var Type =[];

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
    var jsonWghFclt = [];

    /** 선별기 검색조건**/
    var jsonWarehouse = [];



    const fn_init = async function(){

        let result = await Promise.all([
            gfn_getComCdDtls('WGH_FCLT_CD', gv_selectedApcCd),
            gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd),
        ]);

        jsonWghFclt = result[0];
        jsonWarehouse = result[1];

        SBUxMethod.refresh("srch-slt-wghFcltCd");

        fn_createGrid();
        await fn_search();
    }

    /** 하단 우측 grid create **/
    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdRawMtrWghList';
        SBGridProperties.id = 'grdWghFcltDtlList';
        SBGridProperties.jsonref = 'jsonWghFcltDtlList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            /*
            {caption: ["처리"], 		ref: 'itemCd', 		type:'button', width:'100px', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }},
            */

            {
                caption: ["계량대"],
                ref: 'fcltCd',
                type:'combo',
                width:'100px',
                style:'text-align:center;',
                typeinfo : {
                    ref:'jsonWghFclt',
                    displayui : false,
                    label:'cdVlNm',
                    value:'cdVl'
                },
                disabled: true
            },
            {
                caption: ['코드'],
                ref: 'fcltCd',
                width: '80px',
                type: 'output',
                style:'text-align:center'
            },
            {
                caption: ['별칭'],
                ref: 'fcltNm',
                width: '100px',
                type: 'output',
                style:'text-align:left'
            },
            {
                caption: ['설명'],
                ref: 'fcltExpln',
                width: '300px',
                type: 'output',
                style:'text-align:left'
            },
            {
                caption: ['계량횟수'],
                ref: 'prcsNmtm',
                width: '70px',
                type: 'output',
                style:'text-align:right'
            },
            {
                caption: ['최소중량'],
                ref: 'wghtMin',
                width: '100px',
                type: 'output',
                style:'text-align:right',
                format : {
                    type:'number',
                    rule:'#,###'
                }
            },
            {
                caption: ['최대중량'],
                ref: 'wghtMax',
                width: '100px',
                type: 'output',
                style:'text-align:right',
                format : {
                    type:'number',
                    rule:'#,###'
                }
            },
            {
                caption: ['기본창고'],
                ref: 'warehouseSeCd',
                width: '100px',
                type: 'combo',
                typeinfo : {
                    ref:'jsonWarehouse',
                    label:'text',
                    value:'value'
                },
                style:'text-align:center',
                disabled: true
            },
            {
                caption: ['중량단위'],
                ref: 'wghtUnit',
                width: '100px',
                type: 'output',
                style:'text-align:center'
            },
            {
                caption: ['시작일자'],
                ref: 'bgngYmd',
                width: '120px',
                type : 'output',
                format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'},
                style:'text-align:center'
            },
            {
                caption: ['종료일자'],
                ref: 'endYmd',
                width: '120px',
                type : 'output',
                format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'},
                style:'text-align:center'
            },
            {
                caption: ['비고'],
                ref: 'fcltRmrk',
                width: '200px',
                type: 'output',
                style:'text-align:center'
            }

        ]
        grdWghFcltDtlList = _SBGrid.create(SBGridProperties);

        let nRow = grdWghFcltDtlList.getRows();
        grdWghFcltDtlList.addRow(true);
        grdWghFcltDtlList.setCellDisabled(nRow, 0, nRow, grdWghFcltDtlList.getCols() - 1, true);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {

        const editableRow = grdWghFcltDtlList.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.delYn = "N";
        editableRow.gubun = "insert";

        grdWghFcltDtlList.rebuild();
        grdWghFcltDtlList.addRow(true);
        grdWghFcltDtlList.addStatus(nRow,"insert");
        nRow++;
        grdWghFcltDtlList.setCellDisabled(nRow, 0, nRow, grdWghFcltDtlList.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(nRow) {
        let rowIndex = grdWghFcltDtlList.getRow();
        let status = grdWghFcltDtlList.getRowStatus(rowIndex);
        if(status === 0){
        	fn_deleteDtl(rowIndex);
        }else{
        	grdWghFcltDtlList.deleteRow(nRow);
        }
    }


	const fn_search = async function(){

        const fcltCd = SBUxMethod.get("srch-slt-wghFcltCd");
        const param = {
            apcCd : gv_selectedApcCd,
            fcltCd: fcltCd
        }

    	let postJsonPromise = gfn_postJSON("/am/cmns/selectWghDtlInfo.do", param);
        let data = await postJsonPromise;
        console.log(data,"??");

        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	jsonWghFcltDtlList.length = 0;

  	        	//let filterData = data.resultList.filter(item => item.fcltType === "WGH_FCLT");
  	        	data.resultJson.forEach((item, index) => {
  					let fcltVO = {
  					  apcCd : item.apcCd
  					  , fcltType 		: item.fcltType
  					  , fcltCd 		: item.fcltCd
  					  , fcltNm 		: item.fcltNm
  					  , fcltExpln 	: item.fcltExpln
  					  , wghtMin 	: item.wghtMin
  					  , prcsNmtm 		: item.prcsNmtm
  					  , wghtMax 		: item.wghtMax
  					  , warehouseSeCd 		: item.warehouseSeCd
  					  , wghtUnit : item.wghtUnit
  					  , bgngYmd : item.bgngYmd
  					  , endYmd : item.endYmd
  					  , fcltRmrk : item.fcltRmrk
  					  , delYn : item.delYn
  					}
  					jsonWghFcltDtlList.push(fcltVO);
  				});
  	        	grdWghFcltDtlList.rebuild();
  	        	//grdWghFcltDtlList.addRow();
  	        	//grdWghFcltDtlList.setCellDisabled(grdWghFcltDtlList.getRows() -1, 0, grdWghFcltDtlList.getRows() -1, grdWghFcltDtlList.getCols() -1, true);

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_saveFcltList = async function(){
		let allData = grdWghFcltDtlList.getGridDataAll();

		try{

        	allData.forEach(item => {
        		if(gfn_nvl(item.gubun) === ""){
        			item.gubun = "update";
    			}
        		item['apcCd'] = gv_apcCd;
        		item['useYn'] = "Y";
        	})
			let filterData = allData.filter(item => item.delYn === "N")
            let postJsonPromise = gfn_postJSON("/am/cmns/saveWghFcltList.do",filterData);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                	gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
                    fn_searchFcltList();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }


	}


    const fn_deleteDtl = async function(rowIndex){

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let rowData = grdWghFcltDtlList.getRowData(rowIndex);
        let postJsonPromise = gfn_postJSON("/am/wgh/deleteWghApcFclt.do",rowData);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                    gfn_comAlert("I0001");
                    fn_searchFcltList();
                }
            };
        }catch (e){
            console.error(e);
        }
    }









    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });

    const fn_onChangeApc = async function() {
        fn_init();
    }

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
