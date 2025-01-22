<%
    /**
     * @Class Name : acinspPlanReg.jsp
     * @Description : 실사계획등록 화면
     * @author SI개발부
     * @since 2025.01.20
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2025.01.20     박승진       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 실사계획등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 실사계획등록 -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <table class="table table-bordered tbl_fixed">
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
                    <th scope="row" class="th_bg">실사 기준명</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                        <sbux-input id="srch-inp-aiCrtr"
                                     name="srch-slt-aiCrtr"
                                     unselected-text="전체"
                                     class="form-control input-sm"
                                     style="width: 80%"
                                     group-id="group1">
                        </sbux-input>
                    </td>
                    <th scope="row" class="th_bg">계획번호</th>
                    <td class="td_input" colspan="4" style="border-right: hidden;">
                        <sbux-input id="srch-slt-planno"
                                    name="srch-slt-planno"
                                    uitype="text"
                                    class="form-control input-sm"
                                    style="width: 80%"
                                    group-id="group1"
                                    readonly>
                        </sbux-input>
                    </td>
                    <td colspan="4" style="border-top: hidden"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">계획일자</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;">
                        <sbux-datepicker id="srch-dtl-planYmd"
                                         name="srch-dtl-planYmd"
                                         class="form-control pull-right input-sm input-sm-ast"
                                         wrap-style="width:80%"
                                         group-id="group1"
                                         uitype="popup">
                        </sbux-datepicker>
                    </td>
                    <td colspan="9"></td>
                </tr>
                <tr>
                	<th scope="row" class="th_bg">대상품목</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                                <sbux-select
                                	id="srch-slt-itemCd"
                                	name="srch-slt-itemCd"
                                	uitype="single"
                                	class="form-control input-sm input-sm-ast"
                                	unselected-text="전체"
                                	jsondata-ref="jsonApcItemCd"
                                	group-id="group1"
                                	>
                                </sbux-select>
                            </td>
                            <th scope="row" class="th_bg">대상품종</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                                <sbux-select
                                	id="srch-slt-vrtyCd"
                                	name="srch-slt-vrtyCd"
                                	uitype="single"
                                	class="form-control input-sm input-sm-ast"
                                	unselected-text="전체"
                                	jsondata-ref="jsonApcVrtyCd"
                                	filter-source-name="srch-slt-itemCd"
                                    jsondata-filter = "itemCd"
                                    group-id="group1"
                                	>
                                </sbux-select>
                            </td>
                    <td colspan="4" style=""></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">저장위치</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="선택"
                                uitype="single"
                                id="srch-slt-warehouseSeCd"
                                name="srch-slt-warehouseSeCd"
                                class="form-control input-sm input-sm-ast"
                                style="width: 80%"
                                jsondata-ref="jsonComWarehouse"
                                group-id="group1">
                        </sbux-select>
                    </td>
                    <td colspan="9"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">비고</th>
                    <td class="td_input" colspan="8" style="border-right: hidden;">
                        <sbux-textarea id="srch-slt-rmrk"
                                       name="srch-slt-rmrk"
                                       uitype="normal"
                                       class="form-control input-sm"
                                       group-id="group1"
                                       style="width: 92%; height: 100%">
                        </sbux-textarea>
                    </td>
                    <td colspan="4"></td>
                </tr>
                </tbody>
            </table>
            <div style="display: flex; flex-direction: column; gap: 10px">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>실사 계획목록</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-aiPlan" style="height:300px"></div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">

	/** 실사기준 **/
	var jsonAiCrtr = [];


	/** 창고 **/
	var jsonComWarehouse = [];

	/** 품목 **/
	var jsonApcItemCd = [];

	/** 품종 **/
	var jsonApcVrtyCd = [];

	/** 실사기준 **/
	var jsonAiCrtrDtl = [];




    /** grid 변수 셋팅 **/
    var jsonAiPlan = [];
    let grdAiPlan;

    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });



    const fn_initSBselect = async function(){

        let result = await Promise.all([
        	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItemCd, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrtyCd, 	gv_apcCd),			// APC 품종(저장)
			fn_searchAiCrtr()
        ]);

    }


    const fn_init = async function(){
    	await fn_initSBselect();
        await fn_createAiPlan();
        await fn_search();

    }

    const fn_createAiPlan = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-aiPlan';
        SBGridProperties.id = 'grdAiPlan';
        SBGridProperties.jsonref = 'jsonAiPlan';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {caption: ["기준명"],	ref: 'planNm',		type:'output',  width:'150px', style: 'text-align:center;'},
            {caption: ["계획일자"],	ref: 'planYmd',		type:'output',  width:'150px', style: 'text-align:center;'},
            {caption: ["계획번호"],	ref: 'planno',		type:'output',  width:'150px', style: 'text-align:center;'},
            {caption: ['대상품목'], ref: 'itemCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonApcItemCd', label:'label', value:'value', oneclickedit : true}, style:'text-align:center', disabled : {uihidden : true}},
            {caption: ['대상품종'], ref: 'itemVrtyCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonApcVrtyCd', label:'label', value:'itemVrtyCd', oneclickedit : true, filtering: {usemode : true, uppercol : 'itemCd', attrname : 'itemCd', listall: false}}, style:'text-align:center',disabled : {uihidden : true}},
            {caption: ['저장위치'], ref: 'warehouseSeCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonComWarehouse', label:'label', value:'value', oneclickedit : true}, style:'text-align:center',disabled : {uihidden : true}},
            {caption: ["실사여부"],	ref: 'aiYn',		type:'output',  width:'150px', style: 'text-align:center;'},
            {caption: ["비고"],	ref: 'planRmrk',		type:'output',  width:'150px', style: 'text-align:center;'},
        ]
        grdAiPlan = _SBGrid.create(SBGridProperties);
        grdAiPlan.bind('click',fn_grdAiPlanClick)
    }
	const fn_grdAiPlanClick = function(){
		let rowIndex = grdAiPlan.getRow();
		let rowData = grdAiPlan.getRowData(rowIndex);


    	SBUxMethod.set("srch-slt-planno", rowData.planno);
    	SBUxMethod.set("srch-inp-aiCrtr",rowData.aiCrtrType + "/" +rowData.crtrCd);
    	SBUxMethod.set("srch-slt-warehouseSeCd", rowData.warehouseSeCd);
    	SBUxMethod.set("srch-slt-itemCd", rowData.itemCd);
    	SBUxMethod.refresh("srch-slt-vrtyCd");
    	SBUxMethod.set("srch-slt-vrtyCd", rowData.vrtyCd);
    	SBUxMethod.set("srch-dtl-planYmd", rowData.planYmd);
    	SBUxMethod.set("srch-slt-rmrk", rowData.planRmrk);
    	SBUxMethod.set("srch-slt-aiCrtr", rowData.planNm);

	}

	const fn_create = async function(){
		SBUxMethod.refreshGroup("group1");
	}
    const fn_search = async function(){
    	jsonAiPlan.length = 0;
 		let apcCd = gv_apcCd;
 		let aiCrtrType = SBUxMethod.get("srch-slt-aiCrtrType");


 		let obj = {
 				apcCd : apcCd
 				//, aiCrtrType : aiCrtrType
 				};

 		let postJsonPromise = gfn_postJSON("/am/invntr/selectInvntrAiPlan.do",obj );
 	    let data = await postJsonPromise;
 	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				jsonAiPlan.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let spmtPckgUnitVO = {
  					  apcCd : item.apcCd
  					  ,	aiCrtrType 		: item.aiCrtrType
  					  , crtrIndctNm 	: item.crtrIndctNm
  					  , crtrCd      	: item.crtrCd
  					  , crtrVl        	: item.crtrVl
  					  , delYn 			: item.delYn
  					  , gubun			: "update"
  					  , aiYn     		: item.aiYn
  					  , delYn			: item.delYn
  					  , planYmd			: item.planYmd
  					  , planno			: item.planno
  					  , planRmrk		: item.planRmrk
  					  , warehouseSeCd	: item.warehouseSeCd
  					  , itemCd 			: item.itemCd
  					  , vrtyCd			: item.vrtyCd
  					  , itemVrtyCd		: item.itemCd + item.vrtyCd
  					  , planNm			: item.planNm
  					}
  					jsonAiPlan.push(spmtPckgUnitVO);
  				});

  		    	grdAiPlan.rebuild();
  		    	//let rowData = grdAiCrtr.getRowData(grdAiCrtr.getRow());

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

    // 계획번호가 조회가 되면 수정으로 아니면 insert
    const fn_save = async function(){

    	let apcCd = gv_apcCd;
    	let planno = SBUxMethod.get("srch-slt-planno");
    	let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
    	let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let planYmd = SBUxMethod.get("srch-dtl-planYmd");
    	let planRmrk = SBUxMethod.get("srch-slt-rmrk");
    	let planNm = SBUxMethod.get('srch-slt-aiCrtr')

    	if(gfn_nvl(planNm)=== ""){
    		gfn_comAlert("W0002","실사기준명");
    		return;
    	}

    	if(gfn_nvl(planYmd)=== ""){
    		gfn_comAlert("W0002","계획일자");
    		return;
    	}


        try{
            let aiPlanInfo ={
            		apcCd : apcCd
            		, planno : planno
            		, warehouseSeCd : warehouseSeCd
            		, itemCd : itemCd
            		, vrtyCd : vrtyCd
            		, gubun : gfn_nvl(planno) === "" ? "insert" : "update"
            		, planYmd : planYmd
            		, planRmrk : planRmrk
            		, planNm : planNm
            		};

            let postJsonPromise = gfn_postJSON("/am/invntr/insertInvntrAiPlan.do",aiPlanInfo);

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

    	let planno = SBUxMethod.get("srch-slt-planno");
    	if (gfn_nvl(planno) === ""){
    		return;
    	}

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let obj = {
        		apcCd : gv_apcCd
        		, planno : planno
        }
        let postJsonPromise = gfn_postJSON("/am/invntr/deleteInvntrAiPlan.do",obj);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
            	fn_create();
               	fn_search();
               	grdAiPlan.rebuild();
                gfn_comAlert("I0001");
            };
        }catch (e){
            console.error(e);
        }
    }



    const fn_searchAiCrtr = async function(){
    	jsonAiCrtrDtl.length = 0;
 		let apcCd = gv_apcCd;
 		let aiCrtrType = SBUxMethod.get("srch-slt-aiCrtrType");


 		let obj = {
 				apcCd : apcCd
 				};

 		let postJsonPromise = gfn_postJSON("/am/invntr/selectInvntrAiCrtr.do",obj );
 	    let data = await postJsonPromise;
 	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				jsonAiCrtrDtl.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let spmtPckgUnitVO = {
  					  apcCd : item.apcCd
  					  ,	value 		: data.resultList[0].aiCrtrType + "/" + data.resultList[0].crtrCd
  					  , text 	: item.crtrIndctNm
  					}
  					jsonAiCrtrDtl.push(spmtPckgUnitVO);
  				});

  		    	SBUxMethod.refresh("srch-slt-aiCrtr");

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

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>