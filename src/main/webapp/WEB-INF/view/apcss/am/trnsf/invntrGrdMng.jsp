<%
    /**
     * @Class Name : invntrGrdMng.jsp
     * @Description : 재고등급관리 화면
     * @author SI개발부
     * @since 2024.11.25
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2024.11.25     박승진       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 재고등급관리 조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 재고등급관리 -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <%--                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>--%>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
                <%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
                <%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
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
                    <th scope="row" class="th_bg">재고유형</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                        <sbux-select id="srch-slt-invntrType"
                                     name="srch-slt-invntrType"
                                     uitype="single"
                                     unselected-text="전체"
                                     class="form-control input-sm"
                                     style="width: 80%"
                                     jsondata-ref="jsonInvntrType">
                        </sbux-select>
                    </td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
                    <td class="td_input" colspan="4" style="border-right: hidden;border-top: hidden">
                        <div style="display: flex; gap: 5px">
                             <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        style="width: 80%"
                                        jsondata-ref="jsonApcItem">
                                </sbux-select>
                            <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-vrtyCd"
                                        name="srch-slt-vrtyCd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        style="width: 80%"
                                        jsondata-ref="jsonApcVrty"
                                        filter-source-name="srch-slt-itemCd"
										jsondata-filter="itemCd">
                                </sbux-select>
                        </div>
                    </td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>창고구분</th>
                    <td class="td_input" colspan="3" style="border-right: hidden">
                        <sbux-select
                                unselected-text="선택"
                                uitype="single"
                                id="srch-slt-warehouseSeCd"
                                name="srch-slt-warehouseSeCd"
                                class="form-control input-sm input-sm-ast inpt_data_reqed"
                                style="width: 80%"
                                jsondata-ref="jsonComWarehouse">
                        </sbux-select>
                    </td>
                </tr>
                <tr>
					<th scope="row" class="th_bg"><span class="data_required" ></span>등급</th>
					<td colspan="10" class="td_input">
						<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
					</td>
                </tr>

                </tbody>
            </table>
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>재고 목록</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-invntrGrd" style="height:450px"></div>
                </div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">


	/** 대표품목 **/
	var jsonApcItem = [];

	/** 대표품종 **/
	var jsonApcVrty = [];

	/** 창고구분 **/
	var jsonComWarehouse = [];

	/** 재고유형 **/
	var jsonInvntrType = [];


	/** grid 변수 셋팅 **/
	var jsonInvntrGrd = [];
	let grdInvntrGrd;

	var jsonMtrlType = [];

    window.addEventListener("DOMContentLoaded",async function(e){
    	let result = await Promise.all([
			fn_init(),
			stdGrdSelect.init(),
		]);
    });

    const fn_initSBselect = async function(){

        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
            gfn_setComCdSBSelect('srch-slt-invntrType',	jsonInvntrType, 	'INVNTR_SE_CD'),	// 재고유형
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, 	gv_apcCd),			// APC 품종(저장)
        ]);


        //jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd,'');
    }


    const fn_init = async function(){
    	await fn_initSBselect();
        await fn_createInvntrGrdCrtr();
    }

    const fn_createInvntrGrdCrtr = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-invntrGrd';
        SBGridProperties.id = 'grdInvntrGrd';
        SBGridProperties.jsonref = 'jsonInvntrGrd';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
        	{caption: ["재고유형"],	ref: 'invntrType',		type: 'combo', typeinfo : {ref:'jsonInvntrType', label:'label', value:'value', oneclickedit: true},  width:'12%', style: 'text-align:center;' , disabled : {uihidden : true}},
            {caption: ["품목"],	ref: 'itemCd',		type: 'combo', typeinfo : {ref:'jsonApcItem', label:'label', value:'value', oneclickedit: true},  width:'12%', style: 'text-align:center;' , disabled : {uihidden : true}},
            {caption: ["품종"],	ref: 'itemVrtyCd',		type: 'combo', typeinfo : {ref:'jsonApcVrty', label:'label', value:'itemVrtyCd', oneclickedit: true, filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false}},  width:'12%', style: 'text-align:center;' , disabled : {uihidden : true}},
            {caption: ["재고번호"],	ref: 'invntrno',	type:'output',  width:'20%', style: 'text-align:center;' , disabled : {uihidden : true}},
            {caption: ["재고상세"],	ref: 'invntrDtl',		type:'output',  width:'16%', style: 'text-align:center;' , disabled : {uihidden : true}},
            //{caption: ["등급"],	ref: 'grdCd',		type: 'combo', typeinfo : {ref:'jsonApcVrty', label:'cdVlNm', value:'cdVl', oneclickedit: true},  width:'12%', style: 'text-align:center;'},
            {caption: ["등급"],	ref: 'grdNm',		type: 'output', width:'12%', style: 'text-align:center;'},
        ]
        grdInvntrGrd = _SBGrid.create(SBGridProperties);
        grdInvntrGrd.bind('click', fn_view);
    }

    const fn_search = async function(){
 		let apcCd = gv_apcCd;
 		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
 		let itemCd = SBUxMethod.get("srch-slt-itemCd");
 		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
 		let invntrType = SBUxMethod.get("srch-slt-invntrType")

 		if(gfn_nvl(itemCd) === ""){

 			return;
 		}
		if(gfn_nvl(vrtyCd)=== ""){

 			return;
 		}
		if(gfn_nvl(invntrType)=== ""){

 			return;
 		}

 		let obj = {
 				apcCd : apcCd
 				, warehouseSeCd : warehouseSeCd
 				, grdKnd : '0' + invntrType
 				, itemCd : itemCd
 				, vrtyCd : vrtyCd
 				, invntrType : invntrType
 				};

 		let postJsonPromise = gfn_postJSON("/am/invntr/selectInvntrGrdMng.do",obj );
 	    let data = await postJsonPromise;
 	    try{
   			if (_.isEqual("S", data.resultStatus)) {
   				jsonInvntrGrd.length = 0;
   		    	data.resultList.forEach((item, index) => {
   					let spmtPckgUnitVO = {
   						itemCd 			: item.itemCd
   					  , vrtyCd 			: item.vrtyCd
   					  , itemVrtyCd      : item.itemVrtyCd
   					  , invntrno        : item.invntrno
   					  , invntrDtl       : item.invntrDtl
   					  , grdCd			: item.grdCd
   					  , grdNm			: item.grdNm
   					  , invntrType 		: item.invntrType
   					  , stdGrdCd    	: item.stdGrdCd
   					  , stdGrd			: item.stdGrd
   					  , invntrType      : item.invntrType
   					  , warehouseSeCd   : item.warehouseSeCd
   					  , invntrDtl 		: item.stdGrd
   					  , sn			: item.sn

   					}
   					jsonInvntrGrd.push(spmtPckgUnitVO);
   				});
   		    	grdInvntrGrd.rebuild();
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

    const fn_save = async function(){
 		let apcCd = gv_apcCd;
 		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
 		let itemCd = SBUxMethod.get("srch-slt-itemCd");
 		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
 		let invntrType = SBUxMethod.get("srch-slt-invntrType")

 		let rowIdx = grdInvntrGrd.getRow();
 		if(rowIdx === -1){
 			return;
 		};

 		let rowData = grdInvntrGrd.getRowData(rowIdx);
 		let stdGrdList = stdGrdSelect.getStdGrd();

 		let grdCd = stdGrdList.grdJgmt.grdCd;


 		let obj = {
 				apcCd : apcCd
 				, grdCd : grdCd
 				, invntrno : rowData.invntrno
 				, sn : rowData.sn
 				};

 		let url = "";

 		if(invntrType === "1"){
 			url = "/am/invntr/updateRawMtrInvntrGrd.do";
 			obj['rawMtrstdGrdList'] = stdGrdList.stdGrdList;
 		}else if(invntrType === "2"){
 			url = "/am/invntr/updateSortInvntrGrd.do";
 			obj['sortStdGrdList'] = stdGrdList.stdGrdList;
 		}else if(invntrType === "3"){
 			url = "/am/invntr/updateGdsInvntrGrd.do";
 			obj['gdsStdGrdList'] = stdGrdList.stdGrdList;
 		}

 		let postJsonPromise = gfn_postJSON(url,obj );
 	    let data = await postJsonPromise;
 	    try{
   			if (_.isEqual("S", data.resultStatus)) {


   		    	grdInvntrGrd.rebuild();
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

    const fn_view = async function() {

		let nRow = grdInvntrGrd.getRow();
        if (nRow < 1) {
            return;
        }


        let rowData = grdInvntrGrd.getRowData(nRow);



		const stdGrdList = [];
		if (!gfn_isEmpty(rowData.grdCd)) {
			rowData.stdGrdCd.split(',').forEach((item) => {
				const grd = item.split(':');
				stdGrdList.push({
					grdKnd: grd[0],
					grdCd: grd[1],
					grdNv: grd[2],
					grdWght: parseFloat(grd[4]) || 0
				});
			});
		}
		let grdSeCd = SBUxMethod.get("srch-slt-invntrType").padStart(2,'0');

		const stdGrdObj = {
				apcCd: rowData.apcCd,
				grdSeCd: grdSeCd,
				itemCd: rowData.itemCd,
				stdGrdList: stdGrdList,
				grdJgmt: {grdCd: rowData.grdCd}
			}

		await fn_setStdGdsSelect(rowData.itemCd, grdSeCd ,stdGrdObj, _.isEqual(rowData.prcsType, "RR"));

    }

    const fn_setStdGdsSelect = async function(_itemCd,_grdSeCd ,_stdGrdObj, _isWght) {
		await stdGrdSelect.setStdGrd(gv_selectedApcCd, _grdSeCd, _itemCd, _stdGrdObj, _isWght);
	}



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>