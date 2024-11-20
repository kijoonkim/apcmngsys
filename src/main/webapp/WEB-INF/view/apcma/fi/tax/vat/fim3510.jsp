<%
    /**
     * @Class Name 		: fim3510.jsp
     * @Description 	: 부가세정보 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.15
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	신정철		최초 생성
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
    <title>title : 부가세정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section style="height: 100vh">
    <div class="box box-solid">
        <div class="box-header">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
            	<!--[APC] START -->
            	<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            	<!--[APC] END -->
            	<table id="srchTable" class="table table-bordered tbl_fixed table-search-ma">
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
	                    <th scope="row" class="th_bg_search">부가세코드</th>
	                    <td colspan="3" style="border-right: hidden" class="td_input">
	                        <sbux-input 
	                        	id="srch-inp-vatCode" 
	                        	name="srch-inp-vatCode" 
	                        	uitype="text" 
	                        	class="form-control input-sm"
	                        ></sbux-input>
	                    </td>
	                    <td colspan="16" style="border-top: hidden"></td>
	                </tr>
	                </tbody>
            	</table>
            </div>
            
            <div class="row">
	            <div class="ad_tbl_top" style="margin-top: 10px">
	                <ul class="ad_tbl_count">
	                    <li><span>◎ 부가세 정보</span></li>
	                </ul>
	                <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                	<sbux-button
	                       	id="btn-grd-switchMode"
	                           name="btn-grd-switchMode"
	                           uitype="normal"
	                           text="🚫복사해제모드" <%--그리드 복사 불가. 붙여넣기 불가.--%>
	                           class="btn btn-sm btn-outline-danger"
	                           onclick="fn_switchGridMode"
	                           is-change-text="true"
	                           style="margin-right:15px"
						></sbux-button>
						<sbux-button 
							id="btn-grd-addRow"
							name="btn-grd-addRow" 
							uitype="normal" 
							text="행추가" 
							class='btn btn-sm btn-outline-danger' 
							onClick="fn_addRow"
							style="margin-right:5px"
							image-src="/static/resource/svg/grdPlus.svg"
	                           image-style="width:3rem;height:20px"
							image-placement="front"
						></sbux-button>
						<sbux-button 
							id="btn-grd-delRow"
							name="btn-grd-delRow" 
							uitype="normal" 
							text="행삭제" 
							class='btn btn-sm btn-outline-danger' 
							onClick="fn_delRow"
							style="margin-right:5px"
							image-src="/static/resource/svg/grdMinus.svg"
	                           image-style="width:3rem;height:20px"
							image-placement="front"
						></sbux-button>
					</div>
	            </div>
	            <div id="sb-area-grdVat" style="width: 100%; height: 550px"></div>
			</div>
        </div>
    </div>
</section>

<div>
    <sbux-modal
    	style="width:600px" 
    	id="modal-compopup1" 
    	name="modal-compopup1" 
    	uitype="middle" 
    	header-title="" 
    	body-html-id="body-modal-compopup1" 
    	header-is-close-button="true" 
    	footer-is-close-button="false" 
    ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>

</body>
<script type="application/javascript">


	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_empCd = '${loginVO.maEmpCode}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	var p_defaultAcctRule = "${loginVO.maDefaultAcctRule}";
	//-----------------------------------------------------------

	//초기화
	function cfn_init() {
	    
	}
	
	// 신규
	function cfn_add() {
	    fn_create();
	}
	
	// 저장
	function cfn_save() {
	    fn_save();
	}
	
	// 삭제
	function cfn_del() {
		fn_delete();
	}
	
	// 조회
	function cfn_search() {
	    fn_search();
	}
	
	
	// json
	var jsonVatType = [];
	
	
	// 그리드
    var grdVat;
    var jsonVat = [];

    /** grid combo json **/

    window.addEventListener("DOMContentLoaded",function(){
		fn_init();
    });

    lv_mode = "none";
    lv_modeNext = "rowcopy";
    
    const gridModeList = [
    	{id: "none", text: "🚫복사해제모드", next: "rowcopy"},
    	{id: "rowcopy", text: "🏳️‍🌈행복사모드", next: "cellcopy"},
    	{id: "cellcopy", text: "🏁셀복사모드", next: "none"},
    ];
    
    const fn_switchGridMode = function() {
    	fn_setGridMode(lv_modeNext);
    }
    
	const fn_setGridMode = function(_mode) {
    	
    	if (gfn_isEmpty(_mode)) {
    		_mode = lv_mode;
    	}
    	
    	let gridMode;
    	
    	gridModeList.forEach((el) => {
    		if (_.isEqual(_mode, el.id)) {
    			gridMode = el;
    			return false;
    		}
    	});
    	
    	if (gfn_isEmpty(gridMode)) {
    		return;
    	}
    	
    	lv_mode = gridMode.id;
    	lv_modeNext = gridMode.next;
    	
    	SBUxMethod.set('btn-grd-switchMode', gridMode.text);
    	
        const currRow = grdVat.getRow();
        
    	fn_createGrid(lv_mode);
    	
    	if (jsonPayDate.length > 0) {
        	
        	if (_.isEqual(lv_mode, "rowcopy")) {
        		grdVat.setRow(currRow);	
        	} else {
        		grdVat.setRow(currRow);
        		grdVat.selectCell(currRow, 1);
        	}
        }
    }
    
    /**
     * @name fn_init
     * @description 화면 초기화
     * @function
     */
    const fn_init = async function() {
    	
    	
    	await fn_initSBSelect();
    	
    	fn_createGrid();
    	
    }
    
    /**
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
  		
		// 코드정보 설정
		let result = await Promise.all([
				// 부가세유형
            	gfnma_setComSelect(['grdVat'], jsonVatType, 'L_FIT020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'VAT_TYPE_CODE', 'VAT_TYPE_NAME', 'Y', ''),
			]);	
	}
    
    /**
     * @name fn_createGrid
     * @description 그리드 초기화
     * @function
     */
    const fn_createGrid = function(_mode){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdVat';
        SBGridProperties.id = 'grdVat';
        SBGridProperties.jsonref = 'jsonVat';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.selectmode = 'free';
        
        switch (_mode) {
	    	case "none": 		// 복사해제모드
	    		break;
	    	case "rowcopy":		// 행복사모드
	    		SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
	            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
	            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
				break;
	    	case "cellcopy":	// 셀복사모드
	    		SBGridProperties.selectmode = 'free';
	            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
	            break;
	    }
        
        SBGridProperties.extendlastcol = 'scroll';
        
        SBGridProperties.columns = [
            {
            	caption : ['부가세코드'], 
            	ref : 'VAT_CODE',
            	width : '100px', 
            	style : 'text-align:left',    
            	type : 'input',
            },
            {
            	caption : ['부가세코드명'], 
            	ref : 'VAT_NAME', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['부가세유형'], 
            	ref : 'VAT_TYPE_CODE', 
            	width : '120px',
            	style : 'text-align:left', 
            	type : 'combo', 
            	typeinfo : {
            		ref:'jsonVatType', 
            		label:'VAT_TYPE_NAME', 
            		value:'VAT_TYPE_CODE', 
            		oneclickedit: true
            	}
           	},
            {
           		caption : ['부가세율(%)'], 
           		ref : 'VAT_RATE', 
            	datatype: 'number',
           		width : '100px',
           		style : 'text-align:right',    
           		type : 'input',
           		format : {type:'number', rule:'#,##0.000'}
           	},
            {
           		caption : ['상한비율(%)'], 
           		ref : 'LIMIT_PLUS_RATE', 
            	datatype: 'number', 
           		width : '100px',
           		style : 'text-align:right',    
           		type : 'input',
           		format : {type:'number', rule:'#,##0.000'}
           	},
            {
           		caption : ['하한비율(%)'], 
           		ref : 'LIMIT_MINUS_RATE',  
            	datatype: 'number', 
           		width : '100px',
           		style : 'text-align:right',    
           		type : 'input',
           		format : {type:'number', rule:'#,##0.000'}
           	},
            {
           		caption : ['불공제 여부'], 
           		ref : 'NONDED_YN', 
           		width : '100px',
           		style : 'text-align:center',    
           		type : 'checkbox',
           		typeinfo : {
           			checkedvalue : 'Y', 
           			uncheckedvalue : 'N'
           		}
           	},
            {
           		caption : ['계정코드'], 
           		ref : 'ACCOUNT_CODE', 
           		width : '100px',
           		style : 'text-align:left',    
           		type : 'input',
           		disabled: true
           	},
            {
           		caption : ['계정과목명'], 
           		ref : 'ACCOUNT_NAME', 
           		width : '180px',
           		style : 'text-align:left',    
           		type : 'input',
           		disabled: true
           	},
           	{
           		caption : ['계정과목명'], 
           		ref : 'ACCOUNT_CODE', 
           		type:'button',
           		width:'40px',
           		style: 'text-align:center',
   	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popAcc(" + nRow + ")'>...</button>";
   	        	}
           	},
            {
           		caption : ['사용여부'], 
           		ref : 'USE_YN', 
           		width : '100px',
           		style : 'text-align:center', 
           		type : 'checkbox',
           		typeinfo : {
           			checkedvalue : 'Y', 
           			uncheckedvalue : 'N'
           		}
           	},
            {
           		caption : ['적용기간(시작일)'], 
           		ref : 'START_DATE', 
           		width : '100px',
           		style : 'text-align:center', 
           		type : 'inputdate', 
           		format : {
           			type:'date', 
           			rule:'yyyy-mm-dd', 
           			origin : 'yyyymmdd'
           		}
            },
            {
            	caption : ['적용기간(종료일)'], 
            	ref : 'END_DATE', 
            	width : '100px',
            	style : 'text-align:center', 
            	type : 'inputdate', 
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', 
            		origin : 'yyyymmdd'
            	}
            },
            {
            	caption : ['메모'], 
            	ref : 'MEMO', 
            	width : '200px',
            	style : 'text-align:left',    
            	type : 'input'
            },
            {
            	caption : ['정렬순서'], 
            	ref : 'SORT_SEQ', 
            	datatype: 'number', 
            	width : '70px',
           		style : 'text-align:right',    
           		type : 'input',
           		format : {type:'number', rule:'#,###'}
            },
        ];
        
        grdVat = _SBGrid.create(SBGridProperties);
        grdVat.bind('valuechanged', fn_grdVatValueChanged);
        grdVat.bind('afteredit', function() {
        	grdVat.stopEditing();
        });
        
        
    }

    const fn_grdVatValueChanged = function() {
    	
    	var nRow = grdVat.getRow();
    	var nCol = grdVat.getCol();
    	
    	const codeCol = grdVat.getColRef('VAT_CODE');
    	
    	if (_.isEqual(codeCol, nCol)) {
    		
    		const rowData = grdVat.getRowData(nRow, false);	// deep copy
    		
    		const vatCode = rowData['VAT_CODE'];
    		if (!gfn_isEmpty(vatCode)) {
    			const firstChr = vatCode.substr(0, 1);
    			if (firstChr != "A" &&  firstChr != "V") {
    				gfn_comAlert("W0021", "부가세코드 첫글자", "A, V");
    				rowData['VAT_CODE'] = "";
    				grdVat.refresh();
    				return;
    			}
    		}
    		
    	}
    	
    }
    
    
    
    /**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function(){

    	const vatCode = gfn_nvl(SBUxMethod.get("srch-inp-vatCode"));
    	
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
            ,V_P_VAT_CODE           : vatCode
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFim3510.do", {
            getType				: 'json',
            cv_count			: '1',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromise;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_1", listData.cv_1);
            	
            	jsonVat.length = 0;

                listData.cv_1.forEach((item, index) => {
                    const obj = {
                    		VAT_CODE: item.VAT_CODE,
                            VAT_NAME: item.VAT_NAME,
                            COMP_CODE: item.COMP_CODE,
                            COMP_NAME: item.COMP_NAME,
                            VAT_TYPE_CODE: item.VAT_TYPE_CODE,
                            VAT_RATE: item.VAT_RATE,
                            NONDED_YN: item.NONDED_YN,
                            ACCOUNT_CODE: item.ACCOUNT_CODE,
                            ACCOUNT_NAME: item.ACCOUNT_NAME,
                            USE_YN: item.USE_YN,
                            START_DATE: item.START_DATE,
                            END_DATE: item.END_DATE,
                            MEMO: item.MEMO,
                            SORT_SEQ: item.SORT_SEQ,
                            INSERT_USERID: item.INSERT_USERID,
                            INSERT_TIME: item.INSERT_TIME,
                            INSERT_PC: item.INSERT_PC,
                            UPDATE_USERID: item.UPDATE_USERID,
                            UPDATE_TIME: item.UPDATE_TIME,
                            UPDATE_PC: item.UPDATE_PC,
                            LIMIT_PLUS_RATE: item.LIMIT_PLUS_RATE,
                            LIMIT_MINUS_RATE: item.LIMIT_MINUS_RATE,
                    }
                    
                    jsonVat.push(obj);
                    
                });
                
                grdVat.rebuild();
                
                if (jsonVat.length > 0) {
                	
                	if (_.isEqual(lv_mode, "rowcopy")) {
                		grdVat.setRow(1);	
                	} else {
                		grdVat.setRow(1);
                		grdVat.selectCell(1, 1);
                	}
                }
                
            } else {
                alert(listData.resultMessage);
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
	const fn_save = async function() {

 		const updatedData = grdVat.getUpdateData(true, 'all');
        const listData = [];

        for(const item of updatedData) {
        	
        	const compCode 		= gfn_nvl(item.data.COMP_CODE, gv_ma_selectedCorpCd);
        	const clientCode 	= gfn_nvl(item.data.CLIENT_CODE, gv_ma_selectedClntCd);
        	const vatCode = item.data.VAT_CODE;
        	const vatName = item.data.VAT_NAME;
        	const vatTypeCode = item.data.VAT_TYPE_CODE;
        	const vatRate = parseFloat(item.data.VAT_RATE) || 0;
        	const nondedYn = gfn_nvl(item.data.NONDED_YN);
        	const accountCode = gfn_nvl(item.data.ACCOUNT_CODE);
        	const useYn = gfn_nvl(item.data.USE_YN, 'N');
        	const startDate = gfn_nvl(item.data.START_DATE);
        	const endDate = gfn_nvl(item.data.END_DATE);
        	const memo = gfn_nvl(item.data.MEMO);
        	const sortSeq = parseInt(item.data.SORT_SEQ) || 0;
        	const limitPlusRate = gfn_nvl(item.data.LIMIT_PLUS_RATE);
        	const limitMinusRate = gfn_nvl(item.data.LIMIT_MINUS_RATE);
        	
        	if (gfn_isEmpty(vatCode)) {
				gfn_comAlert("W0005", "부가세코드");		//	W0005	{0}이/가 없습니다.
    			return;
        	}
        	
        	if (gfn_isEmpty(vatName)) {
        		gfn_comAlert("W0005", "부가세코드명");		//	W0005	{0}이/가 없습니다.
    			return;
        	}
        	
			if (gfn_isEmpty(vatTypeCode)) {
				gfn_comAlert("W0005", "부가세유형");		//	W0005	{0}이/가 없습니다.
    			return;
        	}
			
			const param = {
	                cv_count: '0',
	                getType: 'json',
	                rownum: item.rownum,
	                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
	                params: gfnma_objectToString({
	                	V_P_DEBUG_MODE_YN	: '',
	                	V_P_LANG_ID			: '',
	                	V_P_COMP_CODE		: compCode,
	                	V_P_CLIENT_CODE		: clientCode,
	                	V_P_VAT_CODE    	: vatCode,
	                	V_P_VAT_NAME    	: vatName,
	                	V_P_VAT_TYPE_CODE   : vatTypeCode,
	                	V_P_VAT_RATE    	: vatRate,
	                	V_P_NONDED_YN   	: nondedYn,
	                	V_P_ACCOUNT_CODE    : accountCode,
	                	V_P_USE_YN  		: useYn,
	                	V_P_START_DATE  	: startDate,
	                	V_P_END_DATE    	: endDate,
	                	V_P_MEMO    		: memo,
	                	V_P_SORT_SEQ    	: sortSeq,
	                	V_P_LIMIT_PLUS_RATE : limitPlusRate,
	                	V_P_LIMIT_MINUS_RATE: limitMinusRate,
	                	
                        V_P_FORM_ID		: p_formId,
                        V_P_MENU_ID		: p_menuId,
                        V_P_PROC_ID		: '',
                        V_P_USERID			: '',
                        V_P_PC				: ''
	                })
			}
			
			listData.push(param);
        }
        
        if (listData.length == 0) {
 			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
 			return;
 		}
        
 		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
     		return;
     	}
 		
		const postJsonPromise = gfn_postJSON("/fi/tax/vat/insertFim3510SList.do", {listData: listData});
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
            	gfn_comAlert("I0001");
                
            	await fn_search();
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
    
    
    const fn_setGrdAccount = function(_nRow, _code, _name) {
    	
    	_code = gfn_nvl(_code);
    	_name = gfn_nvl(_name);
    	
    	const _rowData = grdVat.getRowData(_nRow, false);
    	_rowData.ACCOUNT_CODE = _code;
    	_rowData.ACCOUNT_NAME = _name;
    	
    	console.log("_code", _code);
    	console.log("_name", _name);
    	grdVat.setRowStatus(_nRow, 'u');
    	grdVat.refresh();
    }
    
    const fn_popAcc = function(_nRow) {
    	fn_compopupAccountCode(fn_setGrdAccount, _nRow);
    }
    
	/**
	 * 공통팝업 (그리드)
	 * 계정
	 */	 
    const fn_compopupAccountCode = function(_callbackFnc, _nRow, _code, _name) {
    	
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var searchText0		= gfn_nvl(_code);
        var searchText1		= gfn_nvl(_name);
        
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [searchText0, 	searchText1]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["100px", 		"300px"]
			,itemSelectEvent		: function (data) {
				if (typeof _callbackFnc === 'function') {
					_callbackFnc(_nRow, data.ACCOUNT_CODE, data.ACCOUNT_NAME);
				}
			}
    	});
    	
		SBUxMethod.openModal('modal-compopup1');
    }

	
    // 행 추가
    const fn_addRow = function() {
    	
        const rowIndex = grdVat.getRow();

        if (rowIndex < 0){ //데이터가 없고 행선택이 없을경우.
        	grdVat.addRow(true);
        } else {
        	grdVat.insertRow(rowIndex);
        }
    }

    // 행삭제
    const fn_delRow = async function() {

    	const rowIndex = grdVat.getRow();
    	
    	if (rowIndex < 1) {
    		gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
    	}
    	
		const rowStatus = grdVat.getRowStatus(rowIndex);
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}
			
			grdVat.setRowStatus(rowIndex, 'd');
			
    	} else {
    		grdVat.deleteRow(rowIndex);
    	}

    }
	
	
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
