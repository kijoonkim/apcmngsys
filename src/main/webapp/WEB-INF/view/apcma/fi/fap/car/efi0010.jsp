<%
/**
 * @Class Name 		: efi0010.jsp
 * @Description 	: 계정마스타관리 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.08
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.04.29   	장성주		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 계정마스타관리</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 계정마스타관리 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">
 
				<div class="box-search-ma" >
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
	                <table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
	                    <caption>검색 조건 설정</caption>
	                    <colgroup>
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
							
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
							
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
							
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th scope="row" class="th_bg_search">집계단위</th>
	                            <td colspan="3" class="td_input" >
									<div class="dropdown" style="margin-right:5px" >
									    <button id="srch-cbozaccd-g" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
											group-id="schHeader" 
											required                                       
									    >
									    	<font>선택</font>
									        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
									    </button>
									    <div class="dropdown-menu" aria-labelledby="srch-cbozaccd-g" style="width:300px;height:150px;padding-top:0px;overflow:auto">
									    </div>
									</div>                                    
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">판관비계정코드</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtzaccd-d" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">판관비계정명</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtzaccd-dname" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td></td>
	                            	 
	                            <th scope="row" class="th_bg_search">제조계정코드</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtzaccd-d2" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td></td>
	                        </tr>
	                        <tr>    	 
	                            <th scope="row" class="th_bg_search">제조계정명</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtzaccd-dname2" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td colspan="16"></td>
	                        </tr>    
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row" style="padding-top:10px">
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>계정마스타관리</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                    	<!-- 
							<a href="#" id="btn-copy-clear" class="cu-btn-clear" >
								<img src="../../../resource/images/clear.png" width="20px" /> 복사모드해제
							</a>
	                    	 -->
							<a href="#" id="btn-row-add" class="cu-btn-plus" style="padding-left:10px" >
								<img src="../../../resource/images/plus.png" width="20px" /> 행추가
							</a>
							<a href="#" id="btn-row-del" class="cu-btn-minus" style="padding-left:10px">
								<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
							</a>
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdAcct" style="height:530px; width:100%;">
	                    </div>
	                </div>
                </div>
                
            </div>
        </div>
    </section>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>
 
<!-- inline scripts related to this page -->
<script type="text/javascript">
 
	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	//-----------------------------------------------------------
 
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//집계단위
			gfnma_multiSelectInit({
				target			: ['#srch-cbozaccd-g']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_EFI0020'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'TOT_UNIT_CD'
				,colLabel		: 'TOT_UNIT_NM'
				,columns		:[
		            {caption: "집계코드",		ref: 'TOT_UNIT_CD', 			width:'100px', 		style:'text-align:left'},
		            {caption: "집계단위명",		ref: 'TOT_UNIT_NM',    		width:'200px',  	style:'text-align:left'}
				]
			}),
		]);
	}	
 
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_initSBSelect();
    	fn_createGrid();	
    	//cfn_search();
    	
		$('#btn-row-add').click(function(e){
			e.preventDefault();
			fn_gridRowAdd();
		});
		$('#btn-row-del').click(function(e){
			e.preventDefault();
			fn_gridRowDel();
		});
// 		$('#btn-copy-clear').click(function(e){
// 			e.preventDefault();
// 		});
    });
 
    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    //grid 초기화
    var Efi0010Grid; 			// 그리드를 담기위한 객체 선언
    var jsonEfi0010List = []; 	// 그리드의 참조 데이터 주소 선언
 
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdAcct';
	    SBGridProperties.id 				= 'Efi0010Grid';
	    SBGridProperties.jsonref 			= 'jsonEfi0010List';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
// 	    SBGridProperties.explorerbar 		= 'sort';
// 	    SBGridProperties.useinitsorting 	= true;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["집계단위코드"],				ref: 'ZACCD_G', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["집계단위명"], 				ref: 'ZACCD_GNAME',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["판관비 계정코드(주계정)"],  ref: 'ZACCD_D', 				type:'input',		width:'160px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["판관비 계정명"],    		ref: 'ZACCD_DNAME', 			type:'input',  		width:'200px',  	style:'text-align:left'},
            {caption: ["제조비용 계정코드"],		ref: 'ZACCD_D2',				type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["제조계정명"], 				ref: 'ZACCD_DNAME2', 			type:'output',  	width:'200px',  	style:'text-align:left'},
        	{caption: ["메인여부"], 				ref: 'MAIN_FLAG', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
            {caption: ["부가세처리"], 				ref: 'ZTAX_STATUS',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["매칭여부"], 				ref: 'MATCH_YN', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["개인법인카드여부"], 		ref: 'PER_CARD_YN', 			type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
            {caption: ["기존계정코드"],				ref: 'OLD_ZACCD_D',  			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["기존계정명"], 				ref: 'OLD_ZACCD_DNAME', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["비고"], 					ref: 'etc', 					type:'output',  	width:'150px',  	style:'text-align:left'},
        ];
 
        Efi0010Grid = _SBGrid.create(SBGridProperties);
        Efi0010Grid.bind('click', 'fn_view');
    }
    
    /**
     * 그리드내 팝업(판관비계정코드) 조회
     */
	function fn_gridPopup1(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Efi0010Grid.getCellData(row, 3) 
        let cellData2 = Efi0010Grid.getCellData(row, 5) 
    	fn_compopup1(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(판관비계정코드) 오픈
     */
    var fn_compopup1 = function(row, col, cellData1, cellData2) {
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
		SBUxMethod.openModal('modal-compopup1');
    	
        var replaceText0 	= "_NTSL_MNCO_ACNT_CD_";
        var replaceText1 	= "_NTSL_MNCO_ACNT_NM_"; 
        var strWhereClause 	= "AND ACNTL_CD LIKE '%" + replaceText0 + "%' AND ACNT_NM LIKE '%" + replaceText1 + "%' ";
    	
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ESS_EFI0010_Q1'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 		"명칭"]
   			,searchInputFields		: ["NTSL_MNCO_ACNT_CD", 	"NTSL_MNCO_ACNT_NM"]
   			,searchInputValues		: [cellData1, 	cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",	"계정명"]
   			,tableColumnNames		: ["NTSL_MNCO_ACNT_CD", 	"NTSL_MNCO_ACNT_NM"]
   			,tableColumnWidths		: ["100px", 	"400px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Efi0010Grid.setCellData(row, 3, data['NTSL_MNCO_ACNT_CD'], true, true);
				Efi0010Grid.setCellData(row, 5, data['NTSL_MNCO_ACNT_NM'], true, true);
			}
    	});
    }        
    
    /**
     * 그리드내 팝업(제조비용계정코드) 조회
     */
	function fn_gridPopup2(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Efi0010Grid.getCellData(row, 6) 
        let cellData2 = Efi0010Grid.getCellData(row, 8) 
    	fn_compopup2(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(제조비용계정코드) 오픈
     */
    var fn_compopup2 = function(row, col, cellData1, cellData2) {
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
		SBUxMethod.openModal('modal-compopup1');
    	
        var replaceText0 	= "_NTSL_MNCO_ACNT_CD_";
        var replaceText1 	= "_NTSL_MNCO_ACNT_NM_"; 
        var strWhereClause 	= "AND ACNTL_CD LIKE '%" + replaceText0 + "%' AND ACNT_NM LIKE '%" + replaceText1 + "%' ";
    	
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ESS_EFI0010_Q2'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 		"명칭"]
   			,searchInputFields		: ["NTSL_MNCO_ACNT_CD", 	"NTSL_MNCO_ACNT_NM"]
   			,searchInputValues		: [cellData1, 	cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",	"계정명"]
   			,tableColumnNames		: ["NTSL_MNCO_ACNT_CD", 	"NTSL_MNCO_ACNT_NM"]
   			,tableColumnWidths		: ["100px", 	"400px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Efi0010Grid.setCellData(row, 6, data['NTSL_MNCO_ACNT_CD'], true, true);
				Efi0010Grid.setCellData(row, 8, data['NTSL_MNCO_ACNT_NM'], true, true);
			}
    	});
    }        
    
    //상세정보 보기
    function fn_view() {
 
    	var nCol = Efi0010Grid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = Efi0010Grid.getRow();
		if (nRow < 1) {
            return;
		}
 
        let rowData = Efi0010Grid.getRowData(nRow);
		console.log(rowData);        
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
        if(!SBUxMethod.validateRequired({group_id: "schHeader"}) || !validateRequired("schHeader")) {        
            return false;
        }        
		fn_setEfi0010Grid('Q');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setEfi0010Grid = async function(wtype) {
 
		Efi0010Grid.clearStatus();
 
		let p_cbozaccd_g 		= gfnma_multiSelectGet("#srch-cbozaccd-g", true);
// 		if(!p_cbozaccd_g){
//     		gfn_comAlert("E0000", "집계단위를 선택하세요");
//     		return;
// 		}
		p_cbozaccd_g 			= p_cbozaccd_g['TOT_UNIT_CD'];
		let p_cbozaccd_gname	= gfnma_nvl(gfnma_multiSelectGet("#srch-cbozaccd-g", true)['TOT_UNIT_NM']);
		let p_txtzaccd_d		= gfnma_nvl(SBUxMethod.get("srch-txtzaccd-d"));
		let p_txtzaccd_dname	= gfnma_nvl(SBUxMethod.get("srch-txtzaccd-dname"));
		let p_txtzaccd_d2		= gfnma_nvl(SBUxMethod.get("srch-txtzaccd-d2"));
		let p_txtzaccd_dname2	= gfnma_nvl(SBUxMethod.get("srch-txtzaccd-dname2"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_ZACCD_G		: p_cbozaccd_g	
			,V_P_ZACCD_GNAME	: p_cbozaccd_gname			
			,V_P_ZACCD_D		: p_txtzaccd_d			
			,V_P_ZACCD_DNAME	: p_txtzaccd_dname			
			,V_P_ZACCD_D2		: p_txtzaccd_d2			
			,V_P_ZACCD_DNAME2	: p_txtzaccd_dname2			
			,V_P_USERPC			: p_userId		
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fap/car/selectEfi0010List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});
 
        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
 
  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;
 
  	        	jsonEfi0010List.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						MANDT					: gfnma_nvl(item.CLNT),
  						TXN_ID					: gfnma_nvl(item.TRSC_ID),
  						ZACCD_G					: gfnma_nvl(item.TOT_UNIT_CD),
  						ZACCD_GNAME				: gfnma_nvl(item.TOT_UNIT_NM),
  						ZACCD_D					: gfnma_nvl(item.NTSL_MNCO_ACNT_CD),
  						ZACCD_DNAME				: gfnma_nvl(item.NTSL_MNCO_ACNT_NM),
  						ZACCD_D2				: gfnma_nvl(item.MNFTR_ACNT_CD),
  						ZACCD_DNAME2			: gfnma_nvl(item.ZACCD_DNAME2),
  						OLD_ZACCD_D				: gfnma_nvl(item.BFR_ACNT_CD),
  						OLD_ZACCD_DNAME			: gfnma_nvl(item.BFR_ACNT_DTL_NM),
  						MATCH_YN				: gfnma_nvl(item.MTCHNG_YN),
  						MAIN_FLAD				: gfnma_nvl(item.MAIN_FLAD),
  						ZTAX_STATUS				: gfnma_nvl(item.VAT_APLY_STTS),
  						PER_CARD_YN				: gfnma_nvl(item.PRSNA_CARD_YN)
  					}
  					jsonEfi0010List.push(msg);
  					totalRecordCount ++;
  				});
 
        		Efi0010Grid.rebuild();
  	        	document.querySelector('#listCount').innerText = totalRecordCount;
 
        	} else {
          		alert(data.resultMessage);
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
     * 저장
     */
    function cfn_save() {
    	fn_saveMast();
    }
    
    /**
     * 저장
     */
     const fn_saveMast = async function() {
	    var chkList = Efi0010Grid.getUpdateData(true);
		console.log('---->> grid edit');
		console.log(chkList);
		
		if(chkList.length==0){
        	gfn_comAlert("W0003", "저장(수정)");
			return;
		}
		
		if(confirm("저장(수정) 하시겠습니까?")){
		}else{
			return;
		}		
		
		//서버 전송 리스트
        let listData 	= [];
		let workt		= ""; 
    	for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(chkList[i].status=='i'){
				workt = 'N';
			} else if(chkList[i].status=='u'){
				workt = 'U';
			} else{
				workt = 'D';
			}
            const param = {
                    cv_count	: '0',
                    getType		: 'json',
                    rownum		: chkList[i].rownum,
                    workType	: workt,
                    params		: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN			: '',
                        V_P_LANG_ID					: '',
                        V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedCorpCd),
                        V_P_CLIENT_CODE				: gfnma_nvl(gv_ma_selectedClntCd),
                        V_P_MANDT 					: gfnma_nvl(obj.MANDT),
                        V_P_TXN_ID 					: gfnma_nvl(obj.TXN_ID),
                        V_P_ZACCD_G 				: gfnma_nvl(obj.ZACCD_G),
                        V_P_ZACCD_D					: gfnma_nvl(obj.ZACCD_D),
                        V_P_ZACCD_D2				: gfnma_nvl(obj.ZACCD_D2),
                        V_P_ZACCD_GNAME				: gfnma_nvl(obj.ZACCD_GNAME),
                        V_P_ZACCD_DNAME				: gfnma_nvl(obj.ZACCD_DNAME),
                        V_P_MAIN_FLAG				: gfnma_nvl(obj.MAIN_FLAG),
                        V_P_ZTAX_STATUS				: gfnma_nvl(obj.ZTAX_STATUS),
                        V_P_PER_CARD_YN				: gfnma_nvl(obj.PER_CARD_YN),
                        V_P_FORM_ID					: gfnma_nvl(p_formId),
                        V_P_MENU_ID					: gfnma_nvl(p_menuId),
                        V_P_PROC_ID					: '',
                        V_P_USERID					: '',
                        V_P_PC						: ''
                    })
            	}			
            listData.push(param);
    	}	
 
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/fap/car/saveEfi0010.do", {listData: listData});
 
            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    //cfn_search();
                } else {
                    alert(data.resultMessage);
                }
 
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }   
		
    }
    
    /**
     * 행추가
     */
    var fn_gridRowAdd = function() {
        var nRow = Efi0010Grid.getRow();
        Efi0010Grid.insertRow(nRow, 'below');
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
    	
		if(confirm("정말로 삭제 하시겠습니까?")){
		}else{
			return;
		}		
		Efi0010Grid.deleteRow(Efi0010Grid.getRow());
    }
    
        
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
