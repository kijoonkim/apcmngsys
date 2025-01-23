<%
  /**
   * @Class Name : bscsInvntrCrtrMng.jsp
   * @Description :기초재고 기준관리 화면
   * @author SI개발부
   * @since 2024.11.25
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일        수정자        수정내용
   * @ ---------- ---------- ---------------------------
   * @ 2024.11.25     손민성       최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 기초재고 기준관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 기초재고 기준관리 -->
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
          <th scope="row" class="th_bg">기준유형</th>
          <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
            <sbux-select id="srch-slt-crtrType"
                         name="srch-slt-crtrType"
                         uitype="single"
                         unselected-text="전체"
                         class="form-control input-sm"
                         style="width: 80%"
                         jsondata-ref="jsonCrtrType">
            </sbux-select>
          </td>
          <td colspan="9"></td>
        </tr>
        </tbody>
      </table>
      <div style="display: flex; flex-direction: row; gap: 10px">
        <div style="flex: 1">
          <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
              <li>
                <span>재고기준 목록</span>
              </li>
            </ul>
          </div>
          <div id="sb-area-grdInvntrCrtr" style="height: 500px"></div>
        </div>
        <div style="flex: 1">
          <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
              <li>
                <span>재고기준 상세정보</span>
              </li>
            </ul>
            <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
              <sbux-button disabled="true" id="btnSaveDtl" name="btnSaveDtl" uitype="normal" class="btn btn-sm btn-outline-danger" text="상세저장" onclick="fn_saveDtl"></sbux-button>
            </div>
          </div>
          <div id="sb-area-grdInvntrCrtrDtl" style="height: 500px"></div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
<script type="application/javascript">
  /** grid 변수 셋팅 **/
  //var jsonRtnCrtr = [];
  //var jsonRtnCrtrDtl = [];

  //사용여부
  var jsonUseYn = [];
  
  //재고기준유형
  var jsonCrtrType = [];

  //기준코드
  var jsonInvntrCrtrCd = [];
  
  //DTL_cd
  var jsonInvntrMngAtrb =[];
  
  //재고기준목록
  var grdInvntrCrtr;
  var jsonInvntrCrtr = [];
    
  //재고기준상세정보
  var grdInvntrCrtrDtl;
  var jsonInvntrCrtrDtl =[];

  var jsonDtlCd = [];
  var jsonItemCd = [];
  
  

  //let gridRtnCrtr;
  //let gridRtnCrtrDtl;

  window.addEventListener("DOMContentLoaded",function(){
    fn_init();
  });
  
  const fn_init = async function(){
    await fn_create_invntrCrtr();
    await fn_create_invntrCrtrDtl();
    await fn_initSBSelect();
    await fn_search();
  }
  
  const fn_initSBSelect = async function(){
	  await gfn_setComCdSBSelect('srch-slt-crtrType', jsonCrtrType, 'INVNTR_CRTR_TYPE');
	  jsonInvntrCrtrCd = await gfn_getComCdDtls('INVNTR_CRTR_CD');
	  jsonInvntrMngAtrb = await gfn_getComCdDtls('INVNTR_MNG_ATRB');
      jsonUseYn = await gfn_getComCdDtls('USE_YN');
      jsonItemCd = await gfn_getApcItem(gv_apcCd);
	  
  }
  

  const fn_create_invntrCrtr = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdInvntrCrtr';
    SBGridProperties.id = 'grdInvntrCrtr';
    SBGridProperties.jsonref = 'jsonInvntrCrtr';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.datamergefalseskip = true;
    SBGridProperties.oneclickedit = true;
    SBGridProperties.columns = [
      {caption: [""],	ref: 'delYn',		type:'output',  width:'8%', style: 'text-align:center;',
          renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
              if (gfn_isEmpty(objRowData.delYn)){
                  return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
              } else {
                  return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
              }
      }},
      {caption: ["재고유형"],	ref: 'invntrCrtrType',	type:'combo',  typeinfo : {ref:'jsonCrtrType', 	   label:'label',  value:'value',oneclickedit: true}, width:'15.5%', style: 'text-align:center;'},
      {caption: ["기준코드"],	ref: 'crtrCd',			type:'combo',  typeinfo : {ref:'jsonInvntrCrtrCd', label:'cdVlNm', value:'cdVl', oneclickedit: true}, width:'15.5%', style: 'text-align:center;'},
      {caption: ["기준값"],	    ref: 'crtrVl',			type:'input',  typeinfo : {mask : {alias :'numeric'}},  width:'15.5%', 	style: 'text-align:center;'},
      {caption: ["기준표시명"],	ref: 'crtrIndctNm',		type:'input',  width:'15.5%', 	style: 'text-align:center;'},
      {caption: ["표시순서"],	ref: 'indctSeq',		type:'input',  typeinfo : {mask : {alias :'numeric'}},  width:'15.5%', 	style: 'text-align:center;'},
      {caption: ["사용여부"],	ref: 'useYn',			type:'combo',  typeinfo : {ref :'jsonUseYn', label:'cdVlNm', value:'cdVl', oneclickedit: true}, width:'15.5%',		style: 'text-align:center;'},
    ]
    grdInvntrCrtr = _SBGrid.create(SBGridProperties);
    grdInvntrCrtr.bind("click","fn_searchDtl");
  }
  const fn_create_invntrCrtrDtl = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdInvntrCrtrDtl';
    SBGridProperties.id = 'grdInvntrCrtrDtl';
    SBGridProperties.jsonref = 'jsonInvntrCrtrDtl';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.datamergefalseskip = true;
    SBGridProperties.columns = [
      {caption: [""],	ref: 'delYn',		type:'output',  width:'8%', style: 'text-align:center;',
          renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
              if (gfn_isEmpty(objRowData.delYn)){
                  return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowDtl(" + nRow + ", " + nCol + ")'>추가</button>";
              } else {
                  return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowDtl(" + nRow + ")'>삭제</button>";
              }
      }},
      {caption: ["상세코드"],	ref: 'dtlCd',		type:'combo',  typeinfo : {ref:'jsonDtlCd',label:'cdVlNm', value:'cdVl',oneclickedit: true},width:'18.4%', style: 'text-align:center;'},
      /*{caption: ["상세순번"],	ref: 'dtlSn',		type:'input',  typeinfo : {mask : {alias :'numeric'}},  width:'15.5%', style: 'text-align:center;'},*/
      {caption: ["상세값"],	    ref: 'dtlVl',	    type:'input',  typeinfo : {mask : {alias :'numeric'}},  width:'18.4%', style: 'text-align:center;'},
      {caption: ["상세표시명"],	ref: 'dtlIndctNm',	type:'input',  width:'18.4%', style: 'text-align:center;'},
      {caption: ["표시순서"],	ref: 'indctSeq',	type:'input',  typeinfo : {mask : {alias :'numeric'}},  width:'18.4%', 	style: 'text-align:center;'},
      {caption: ["사용여부"],	ref: 'useYn',		type:'combo',  typeinfo : {ref :'jsonUseYn', label:'cdVlNm', value:'cdVl', oneclickedit: true}, width:'18.4%',		style: 'text-align:center;'},
    ]
    grdInvntrCrtrDtl = _SBGrid.create(SBGridProperties);
    //grdInvntrCrtrDtl.bind("click","fn_setDtlCd");
  }
  

  /**
   * @name fn_addRow
   * @description 행추가
   * @param {number} nRow
   */
  const fn_addRow = async function(nRow, nCol) {

      const editableRow = grdInvntrCrtr.getRowData(nRow, false);
      editableRow.delYn = "N";
      editableRow.gubun = "insert";
      //grdInvntrCrtr.rebuild();
      grdInvntrCrtr.addRow(true);
      /* nRow++;
      grdInvntrCrtr.setCellDisabled(nRow, 0, nRow, grdInvntrCrtr.getCols() - 1, true);*/
      let mRow = nRow + 1;
      grdInvntrCrtr.setCellDisabled(nRow, 0, nRow, grdInvntrCrtr.getCols() - 1, false);//추가되는 행
      grdInvntrCrtr.setCellDisabled(mRow, 0, mRow, grdInvntrCrtr.getCols() - 1, true);//마지막행

      /** 저장버튼 활성화 **/
      //SBUxMethod.attr("btnSave","disabled","false");
  }
 
   const fn_delRow = async function(nRow){
       let rowData = grdInvntrCrtr.getRowData(nRow);
       if(!gfn_isEmpty(rowData.apcCd)){
           if(!gfn_comConfirm("Q0001","등록된 목록입니다. 삭제")){
               return;
           }
       }else{
           grdInvntrCrtr.deleteRow(nRow);
           return;
       }
       try {
         //let deleteParam = {shpgotApcCrtrVO:rowData}

         const postJsonPromise = gfn_postJSON("/am/trnsf/deleteInvntrCrtr.do",{
           apcCd : rowData.apcCd
           ,invntrCrtrType : rowData.invntrCrtrType
           ,crtrCd : rowData.crtrCd
         });
         const data = await postJsonPromise;

         if (!_.isEqual("S", data.resultStatus)) {
           gfn_comAlert(data.resultCode, data.resultMessage);
           return;
         }
         gfn_comAlert("I0001");
         fn_search();

       }catch (e){
         console.log(e);
       }


   }
  /**
   * @name fn_addRow
   * @description 행추가
   * 하위 그리드 용 SB이슈
   * @param {number} nRow
   */
  const fn_addRowDtl = async function(nRow, nCol) {
    const editableRow = grdInvntrCrtrDtl.getRowData(nRow, false);
    editableRow.delYn = "N";
    editableRow.gubun = "insert";
    /** 상단 식별 키값 셋팅 **/
    let uRow = grdInvntrCrtr.getRow();
    let uRowData = grdInvntrCrtr.getRowData(uRow);
    editableRow.invntrCrtrType = uRowData.invntrCrtrType;
    editableRow.crtrCd = uRowData.crtrCd;

    grdInvntrCrtrDtl.rebuild();
    grdInvntrCrtrDtl.addRow(true);
    nRow++;
    grdInvntrCrtrDtl.setCellDisabled(nRow, 0, nRow, grdInvntrCrtrDtl.getCols() - 1, true);
    /** 상세 저장 버튼 활성화 **/
    //SBUxMethod.attr("btnSaveDtl","disabled","false");
  }

  const fn_delRowDtl = async function(nRow){
    let rowData = grdInvntrCrtrDtl.getRowData(nRow);
    if(!gfn_isEmpty(rowData.apcCd)){
      if(!gfn_comConfirm("Q0001","등록된 목록입니다. 삭제")){
        return;
      }
    }else{
      grdInvntrCrtrDtl.deleteRow(nRow);
      return;
    }

    const postJsonPromise = gfn_postJSON("/am/trnsf/deleteInvntrCrtrDtl.do",rowData);
    const data = await postJsonPromise;

    if (!_.isEqual("S", data.resultStatus)) {
      gfn_comAlert(data.resultCode, data.resultMessage);
      return;
    }
    gfn_comAlert("I0001");
    await fn_search();
  }



    const fn_search = async function(){
    	jsonInvntrCrtrDtl.length = 0;
    	grdInvntrCrtrDtl.rebuild();

    	let invntrCrtrType = SBUxMethod.get("srch-slt-crtrType");
        try {
            let postJsonPromise = gfn_postJSON("/am/trnsf/selectInvntrCrtr.do",{
              apcCd : gv_apcCd,
              invntrCrtrType : invntrCrtrType
            });

            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
              gfn_comAlert(data.resultCode, data.resultMessage);
              return;
            }
            if(data.resultList.length > 0) {
              jsonInvntrCrtr = data.resultList;
              grdInvntrCrtr.rebuild();
              let rowLength = data.resultList.length;
              let nRow = grdInvntrCrtr.getRows();
              grdInvntrCrtr.addRow(true);
              let mRow = nRow + 1;
              grdInvntrCrtr.setCellDisabled(1, 1, rowLength,grdInvntrCrtr.getCols() - 5, true);
              grdInvntrCrtr.setCellDisabled(nRow, 0, nRow,grdInvntrCrtr.getCols() - 1, true);
            }else{
              jsonInvntrCrtr.length = 0;
              grdInvntrCrtr.rebuild();
              let nRow = grdInvntrCrtr.getRows();
              grdInvntrCrtr.addRow(true);
              grdInvntrCrtr.setCellDisabled(nRow, 0, nRow,grdInvntrCrtr.getCols() - 1, true);
            }

        }catch (e){
          console.log(e);
        }

    }
    
    const fn_save = async function(){
    	let rowData = grdInvntrCrtr.getRowData(grdInvntrCrtr.getRow());
        let getStatus = grdInvntrCrtr.getRowStatus(grdInvntrCrtr.getRow());

    	let allData = grdInvntrCrtr.getGridDataAll();
    	// var invntrCrtrList = [];

    	try{
    		/* allData.forEach((item, index)=>{
    			if(item.delYn === "N"){
    				invntrCrtrList.push({
        				apcCd : gv_apcCd
        				,invntrCrtrType : item.invntrCrtrType
        				,crtrCd : item.crtrCd
        				,crtrVl : item.crtrVl
        				,crtrIndctNm : item.crtrIndctNm
        				,indctSeq : item.indctSeq
        				,useYn : item.useYn
        			})
    			}
    		}) */

             // allData = allData.filter(item => item.delYn === 'N');
            let crtrCd
             allData = allData.filter((item,index) =>{
               if(gfn_nvl(item.gubun) === ""){
                 item.gubun = "update";
               }
                item.apcCd = gv_apcCd;
                return item.delYn === 'N'
             });
              let getInsertData = jsonInvntrCrtr.filter(item =>item.gubun === "insert");
              let getUpdateData = jsonInvntrCrtr.filter(item =>item.gubun === "update");

              getInsertData.forEach(insertItem => {
                  let equalData = getUpdateData.find(updateItem => insertItem.invntrCrtrType === updateItem.invntrCrtrType && insertItem.crtrCd === updateItem.crtrCd);
                  if(equalData !== undefined && Object.keys(equalData).length > 0){
                    gfn_comAlert("W0009","재고유형,기준코드");
                    return;
                  }
              });


    		let postJsonPromise = gfn_postJSON("/am/trnsf/insertInvntrCrtr.do",allData);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    //gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    fn_search();
                    return;
                }
            }
    		
    	}catch (e){
            console.log(e);
        }
    	
    	
    }

    const fn_searchDtl= async function(){
        let nRow = grdInvntrCrtr.getRow();
        let rowData = grdInvntrCrtr.getRowData(nRow);
        let postJsonPromise = gfn_postJSON("/am/trnsf/selectInvntrCrtrDtl.do",rowData);
        let data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
          gfn_comAlert(data.resultCode, data.resultMessage);
          return;
        }else{
          /** reset **/
          jsonInvntrCrtrDtl.length = 0;
          SBUxMethod.attr("btnSaveDtl","disabled","false");

          /*jsonDtlCd 세팅 */
          let getInvntrCrtrCd = rowData.crtrCd;
          if(getInvntrCrtrCd === "INVNTR_MNG_ATRB") {
            jsonDtlCd = jsonInvntrMngAtrb.map(item => ({ cdVl: item.cdVl, cdVlNm : item.cdVlNm}));
          }else if(getInvntrCrtrCd === "INVNTR_MNG_ITEM"){
            jsonDtlCd = jsonItemCd.map(item =>({ cdVl : item.itemCd, cdVlNm : item.itemNm}));
          }
          grdInvntrCrtrDtl.rebuild();

          if(data.resultList.length > 0){
            jsonInvntrCrtrDtl = data.resultList;
            grdInvntrCrtrDtl.rebuild();
            let nRow = grdInvntrCrtrDtl.getRows();
            grdInvntrCrtrDtl.addRow(true);
            grdInvntrCrtrDtl.setCellDisabled(nRow, 0, nRow, grdInvntrCrtrDtl.getCols() - 1, true);
          }else{
            grdInvntrCrtrDtl.rebuild();
            let nRow = grdInvntrCrtrDtl.getRows();
            grdInvntrCrtrDtl.addRow(true);
            grdInvntrCrtrDtl.setCellDisabled(nRow, 0, nRow, grdInvntrCrtrDtl.getCols() - 1, true);
          }
        }
    }

    /*
    const fn_setDtlCd = async function(){
      let nRow = grdInvntrCrtr.getRow();
      let rowData = grdInvntrCrtr.getRowData(nRow);
      console.log("dtl클릭시 rowData ",rowData);
      let getInvntrCrtrCd = rowData.crtrCd;
      if(getInvntrCrtrCd === "INVNTR_MNG_ATRB") {
        jsonDtlCd = jsonInvntrMngAtrb.map(item => ({ cdVl: item.cdVl, cdVlNm : item.cdVlNm}))
        console.log(jsonDtlCd);
      }else if(getInvntrCrtrCd === "INVNTR_MNG_ITEM"){
        jsonDtlCd = jsonItemCd.map(item =>({ cdvl : item.itemCd, cdVlNm : item.itemNm}))
        console.log(jsonDtlCd);

      }
      grdInvntrCrtrDtl.rebuild();
    }*/

    const fn_saveDtl = async function(){
        let allData = grdInvntrCrtrDtl.getGridDataAll();
      try{
          allData = allData.filter((item,index) =>{
            if(gfn_nvl(item.gubun) === ""){
              item.gubun = "update";
            }
            item.apcCd = gv_apcCd;
            return item.delYn === 'N'
          });
          let postJsonPromise = gfn_postJSON("/am/trnsf/insertInvntrCrtrDtl.do",allData);
          if(postJsonPromise){
            let data = await postJsonPromise;
            if (data.resultStatus == "S") {
              gfn_comAlert("I0001");
            }
          }
      }catch (e){
        console.log(e);
      }
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>