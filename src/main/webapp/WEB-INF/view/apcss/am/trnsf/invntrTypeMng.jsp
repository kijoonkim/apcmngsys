<%
  /**
   * @Class Name : invntrTypeMng.jsp
   * @Description : 재고유형관리 화면
   * @author SI개발부
   * @since 2025.01.14
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일        수정자        수정내용
   * @ ---------- ---------- ---------------------------
   * @ 2025.01.14     박승진       최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 재고유형관리 조회</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 재고유형관리 -->
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

	/** 운송구분 **/
	var jsonTrsprtSeCd = [];

	/** 상품구분 **/
	var jsonGdsSeCd = [];

	/** 입고구분 **/
	var jsonWrhsSeCd = [];


	/** grid 변수 셋팅 **/
	var jsonInvntrGrd = [];
	let grdInvntrGrd;

	var jsonMtrlType = [];

 window.addEventListener("DOMContentLoaded",async function(e){
    	let result = await Promise.all([
			fn_init(),
		]);
    });

 const fn_initSBselect = async function(){

     let result = await Promise.all([
         gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
         gfn_setComCdSBSelect('srch-slt-invntrType',	jsonInvntrType, 	'INVNTR_SE_CD'),	// 재고유형
		 gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
		 gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, 	gv_apcCd),			// APC 품종(저장)
		 gfn_setComCdSBSelect('grdInvntrGrd',	jsonWrhsSeCd, 	'WRHS_SE_CD'),	// 입고구분
		 gfn_setComCdSBSelect('grdInvntrGrd',	jsonGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd),	// 상품구분
		 gfn_setComCdSBSelect('grdInvntrGrd',	jsonTrsprtSeCd, 'TRSPRT_SE_CD')	// 운송구분
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
    	  {
      		caption: [""], 			ref: 'checkedYn', 			type:'checkbox', 	width:'50px',	style:'text-align:center',
					typeinfo: {
						ignoreupdate : true,
						fixedcellcheckbox : {
							usemode : true,
							rowindex : 1,
							deletecaption : false
						},
						checkedvalue : 'Y',
						uncheckedvalue : 'N'
					}
      	},
      	{caption: ["재고유형"],	ref: 'invntrType',		type: 'combo', typeinfo : {ref:'jsonInvntrType', label:'label', value:'value', oneclickedit: true},  width:'150px', style: 'text-align:center;' , disabled : {uihidden : true}},
          {caption: ["품목"],	ref: 'itemCd',		type: 'combo', typeinfo : {ref:'jsonApcItem', label:'label', value:'value', oneclickedit: true},  width:'150px', style: 'text-align:center;' , disabled : {uihidden : true}},
          {caption: ["품종"],	ref: 'itemVrtyCd',		type: 'combo', typeinfo : {ref:'jsonApcVrty', label:'label', value:'itemVrtyCd', oneclickedit: true, filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false}},  width:'150px', style: 'text-align:center;' , disabled : {uihidden : true}},
          {caption: ["재고번호"],	ref: 'invntrno',	type:'output',  width:'150px', style: 'text-align:center;' , disabled : {uihidden : true}},
          {caption: ["재고상세"],	ref: 'invntrDtl',		type:'output',  width:'150px', style: 'text-align:center;' , disabled : {uihidden : true}},
          {caption: ["입고유형"],	ref: 'wrhsSeCd',		type:'combo', typeinfo : {ref:'jsonWrhsSeCd', label:'label', value:'value', oneclickedit: true},   width:'150px', style: 'text-align:center;'},
          {caption: ["상품구분"],	ref: 'gdsSeCd',		type:'combo', typeinfo : {ref:'jsonGdsSeCd', label:'label', value:'value', oneclickedit: true},  width:'150px', style: 'text-align:center;'},
          {caption: ["운송구분"],	ref: 'trsprtSeCd',		type:'combo', typeinfo : {ref:'jsonTrsprtSeCd', label:'label', value:'value', oneclickedit: true},  width:'150px', style: 'text-align:center;'},
      ]
      grdInvntrGrd = _SBGrid.create(SBGridProperties);
  }

  const fn_search = async function(){
		let apcCd = gv_apcCd;
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let invntrType = SBUxMethod.get("srch-slt-invntrType");




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
				, itemCd : itemCd
				, vrtyCd : vrtyCd
				, invntrType : invntrType
				, grdKnd : '0' + invntrType
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
 					  , sn				: item.sn
 					  , wrhsSeCd        : item.wrhsSeCd
 					  , gdsSeCd        : item.gdsSeCd
 					  , trsprtSeCd        : item.trsprtSeCd

 					}
 					jsonInvntrGrd.push(spmtPckgUnitVO);
 				});
 		    	grdInvntrGrd.rebuild();

 		    	let trsprtSeCdCol = grdInvntrGrd.getColRef('trsprtSeCd');
 				if(invntrType === "2"){
 					grdInvntrGrd.setColHidden(trsprtSeCdCol, true);
 				}else{
 					grdInvntrGrd.setColHidden(trsprtSeCdCol, false);
 				}
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


		let allData = grdInvntrGrd.getGridDataAll();
		let filter = allData.filter(item => item.checkedYn === "Y");
		let param = [];
		filter.forEach(item => {
			var obj = {
					apcCd : apcCd
					, invntrno : item.invntrno
					, sn : item.sn
					, trsprtSeCd : item.trsprtSeCd
					, gdsSeCd : item.gdsSeCd
					, wrhsSeCd : item.wrhsSeCd
					};
			param.push(obj);
		})



		let url = "";

		if(invntrType === "1"){
			url = "/am/invntr/updateRawMtrInvntrType.do";
		}else if(invntrType === "2"){
			url = "/am/invntr/updateSortInvntrType.do";
		}else if(invntrType === "3"){
			url = "/am/invntr/updateGdsInvntrType.do";
		}

		let postJsonPromise = gfn_postJSON(url,param );
	    let data = await postJsonPromise;
	    try{
 			if (_.isEqual("S", data.resultStatus)) {
				fn_search();
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