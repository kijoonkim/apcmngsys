<%
    /**
     * @Class Name 		: fim5150.jsp
     * @Description 	: 지금방법/조건 화면
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
    <title>title : 지금방법/조건</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3><!-- 지급방법/조건 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button
                	id="srch-btn-payTermTest"
                    name="srch-btn-payTermTest"
                    uitype="normal"
                    text="🧮테스트"
                    class="btn btn-sm btn-outline-danger"
                    onclick="fn_payTermTest"
				></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<div style="padding-bottom:10px">
				<!--[APC] START -->
	            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
	            <!--[APC] END -->
				
				<!--[pp] 검색 -->
                <table class="table table-bordered tbl_fixed" style="margin-bottom:5px">
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
                            <th scope="row" class="th_bg">수금,지급구분</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-txnType"
                                        name="srch-slt-txnType"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonTxnType"
                                />
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">기준일자</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
									uitype="popup" 
									id="srch-dtp-standardDay" 
									name="srch-dtp-standardDay"
									date-format="yyyy-mm-dd" 
									class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
									wrap-style="border:0;padding:0;"
									group-id="panHeader"
		                            required
								/>	
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">지급조건</th>
                            <td colspan="3" class="td_input"">
                                <div class="dropdown">
									<button 
										style="width:100%;text-align:left" 
										class="btn btn-sm btn-light dropdown-toggle" 
										type="button" 
										id="srch-inp-payTermTest" 
										data-toggle="dropdown" 
										aria-haspopup="true" 
										aria-expanded="false"
									>
										<font>선택</font>
										<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div 
										class="dropdown-menu" 
										aria-labelledby="srch-inp-payTermTest" 
										style="width:300px;height:400px;padding-top:0px;overflow:auto"
									></div>
								</div> 
                            </td>  
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">지급기준코드</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                	uitype="text"
                                    id="srch-inp-payTermCode"
                                    name="srch-inp-payTermCode"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    onkeyenter="fn_search"
                                />
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">지급기준명</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                	uitype="text"
                                    id="srch-inp-payTermName"
                                    name="srch-inp-payTermName"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    onkeyenter="fn_search"
                                />
                            </td>
                            <td></td>
							<th scope="row" class="th_bg">지급예정일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                	uitype="text"
                                    id="srch-inp-expectedDate"
                                    name="srch-inp-expectedDate"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                />	
                            </td>
                            <td></td>
                        </tr>
                 	</tbody>
               	</table>
               	<div class="ad_tbl_top">
                	<ul class="ad_tbl_count">
                    	<li>
                        	<span>지급기준 관리</span>
                        </li>
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
                <div id="sb-area-grdPayDate" style="height:500px;"></div>
			</div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_empCd = '${loginVO.maEmpCode}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	//-----------------------------------------------------------

	//초기화
	function cfn_init() {
		fn_create();
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


    // ${comMenuVO.menuId}

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
    	
    	//const gridMode = _.find(gridModeList, {id, _mode});

    	if (gfn_isEmpty(gridMode)) {
    		return;
    	}
    	
    	lv_mode = gridMode.id;
    	lv_modeNext = gridMode.next;
    	
    	SBUxMethod.set('btn-grd-switchMode', gridMode.text);
    	//SBUxMethod.refresh('btn-grd-switchMode');
        //const datas = grdPayDate.getGridDataAll();
        //_SBGrid.destroy('grdPayDate');
    	
        const currRow = grdPayDate.getRow();
        
    	fn_createGrid(lv_mode);
    	
    	if (jsonPayDate.length > 0) {
        	
        	if (_.isEqual(lv_mode, "rowcopy")) {
        		grdPayDate.setRow(currRow);	
        	} else {
        		grdPayDate.setRow(currRow);
        		grdPayDate.selectCell(currRow, 3);
        	}
        }
    }
    
    // 공통코드 JSON
    
    var jsonTxnType = [];			// 지급,수금구분	TXN_TYPE		COM045
    var jsonBasisType = [];			// 기산일기준 		BASIS_TYPE		FIM037
    var jsonPeriodType = [];		// 기간유형 		PERIOD_TYPE		FIM038		
    var jsonPayTerm = [];			// 지급조건
    var jsonStartRule = [];			// 시작일 룰		START_RULE		FIM043
    var jsonPayRckDay = [];			// 지급기준기산일					FIM042
    var jsonStdType = [];			// 휴일제외적용일 	STD_TYPE 		FIM040	
    var jsonPayMethod = [];			// 지급방식			PAY_METHOD		FIM081

    
    // 메인그리드
    var grdPayDate;
    var jsonPayDate = [];
    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function() {

    	let nowDate = new Date();
		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);
		
		SBUxMethod.set("srch-dtp-standardDay", lastYmd);
		
    	await fn_initSBSelect();
    	
        fn_createGrid(lv_mode);
    }

	/**
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
		
        let rst = await Promise.all([
        	// 지급,수금구분	TXN_TYPE		COM045
        	gfnma_setComSelect(['srch-slt-txnType'], jsonTxnType, 'L_COM045', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        	// 기산일기준 		BASIS_TYPE		FIM037
        	gfnma_setComSelect(['grdPayDate'], jsonBasisType, 'L_FIM037', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        	// 기간유형 		PERIOD_TYPE		FIM038
        	gfnma_setComSelect(['grdPayDate'], jsonPeriodType, 'L_FIM038', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        	// 시작일 룰		START_RULE		FIM043
        	gfnma_setComSelect(['grdPayDate'], jsonStartRule, 'L_FIM043', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        	// 지급기준기산일					FIM042
        	gfnma_setComSelect(['grdPayDate'], jsonPayRckDay, 'L_FIM042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        	// 휴일제외적용일 	STD_TYPE 		FIM040
        	gfnma_setComSelect(['grdPayDate'], jsonStdType, 'L_FIM040', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        	// 지급방식			PAY_METHOD		FIM081
        	gfnma_setComSelect(['grdPayDate'], jsonPayMethod, 'L_FIM081', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        	
        	// 지급조건
        	fn_setPayTerm(),
        	
        	]);
	}
	
	const fn_setPayTerm = async function() {
 		
		jsonPayTerm.length = 0;
		
		const paramObj = {
	                V_P_DEBUG_MODE_YN	: '',
	                V_P_LANG_ID			: '',
	                V_P_COMP_CODE		: gv_ma_selectedApcCd,
	                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
	                
	                V_P_PAY_TERM_CODE	: '', 
	                V_P_PAY_TERM_NAME	: '', 
	                V_P_TXN_TYPE		: '', 
	                
	                V_P_FORM_ID			: p_formId,
	                V_P_MENU_ID			: p_menuId,
	                V_P_PROC_ID			: '',
	                V_P_USERID			: '',
	                V_P_PC				: ''
	            };
		console.log("paramObj", paramObj);
	        	
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/tri/selectFim5150List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

		const listData = await postJsonPromiseForList;

	    try {
	    	
			if (_.isEqual("S", listData.resultStatus)) {
	          	
				console.log("listData.cv_1", listData.cv_1);
	          	
				listData.cv_1.forEach((item, index) => {
		        	const obj = {
		        		PAY_TERM_CODE: item.PAY_TERM_CODE,
		        		PAY_TERM_NAME: item.PAY_TERM_NAME,
					}
		                 
				jsonPayTerm.push(obj);
		        	
	        	});
			}
		    
		} catch (e) {
   			if (!(e instanceof Error)) {
   				e = new Error(e);
   			}
   			console.error("failed", e);
   			console.error("failed", e.message);
   		}
		
		console.log(jsonPayTerm);
		
		const selectObj = {
			target: '#srch-inp-payTermTest',
			selectValue	: '',
			dropType	: 'down', 	// up, down
			dropAlign	: 'left', 	// left, right
			colValue	: 'PAY_TERM_CODE',
			colLabel	: 'PAY_TERM_NAME',
			columns		:[
		    	{caption: "지급기준코드",	ref: 'PAY_TERM_CODE', 	width:'120px',  	style:'text-align:left'},
		        {caption: "지급기준명",		ref: 'PAY_TERM_NAME',   width:'180px',  	style:'text-align:left'}
			],
     	}          
	   	
		try {
	   		innerCreate(selectObj, selectObj.target, jsonPayTerm);
	   	} catch (e) {
	   		if (!(e instanceof Error)) {
	   			e = new Error(e);
	   		}
	   		console.error("failed", e);
	   		console.error("failed", e.message);
	   	}	
	}
	 
    const innerCreate = function (selectObj, tarId, datas) {
		
    	const _dropType		= selectObj.dropType;
    	const _dropAlign	= selectObj.dropAlign;
    	const _colValue		= selectObj.colValue;
    	const _colLabel		= selectObj.colLabel;
    	const _columns		= selectObj.columns;
    	const _callback		= selectObj.callback;
    	
        //style set
        if(_dropType=='down'){
            $(tarId).closest('div').addClass('dropdown');
        } else {
            $(tarId).closest('div').addClass('dropup');
        }
        if(_dropAlign=='right'){
            $(tarId).closest('div').find('.dropdown-menu').addClass('dropdown-menu-right');
        }
        
        let htm 	= '';		
        let tcss 	= 'padding-top:4px;padding-bottom:4px;font-weight:bold;';
        htm += '<table class="table table-sm table-bordered table-hover" style="width:100%;display:inline-block">';
        htm += '<thead style="position:sticky;top:0">';
        htm += '<tr style="background:#dddcdc;text-align:left;">';
        //table head
        for(i=0; i<_columns.length; i++){
            htm += '<th style="' + tcss + 'width:' + _columns[i]['width'] + ';' + _columns[i]['style'] + '" >' + _columns[i]['caption'] + '</th>';
        }	
        htm += '</tr>';
        htm += '</thead>';
        htm += '<tbody></tbody>';
        htm += '</table>';
        $(tarId).closest('div').find('.dropdown-menu').html(htm);
        $(tarId).closest('div').find('.dropdown-menu').css('border', 'solid 1px #a3a1a1');
        $(tarId).closest('div').addClass('cu-multi-select');
        
        //table tbody
        htm = '';
        htm += '<tr style="cursor:pointer" class="clickable-row">';
        htm += '<td colspan="'+ _columns.length +'" style="text-align:center;" cu-code="">선택</td>';
        htm += '</tr>';
        for(i=0; i<datas.length; i++){
            const obj = datas[i];
            htm += '<tr style="cursor:pointer" class="clickable-row">';
            for(j=0; j<_columns.length; j++){
                htm += '<td style="' + _columns[j]['style'] + '" cu-code="' + _columns[j]['ref'] + '">' + gfnma_nvl(obj[_columns[j]['ref']]) + '</td>';
            }	
            htm += '</tr>';
        }
        
        $(tarId).closest('div').find('tbody').html(htm);
        
        //button clear
        $(tarId).closest('div').find('button').find('font').text('선택');
        $(tarId).closest('div').find('button').attr('cu-value', '');
        $(tarId).closest('div').find('button').attr('cu-label', '');
        
        //tr click event
        $(tarId).closest('div').find('.clickable-row').click(function(){
            if($(this).hasClass('active')){
                $(this).removeClass('active')
                $(tarId).attr('cu-value', '');
                $(tarId).attr('cu-label', '');
                $(tarId).find('font').text('선택');
            } else {
                $(this).addClass('active').siblings().removeClass('active');
                const empty = $(this).find('[cu-code=""]').text();
                
                let cu_value;
                let cu_label;
                
                if(empty) {
                    $(tarId).attr('cu-value', '');
                    $(tarId).attr('cu-label', '');
                    $(tarId).find('font').text('선택');
                } else {
                    cu_value = $(this).find('[cu-code=' + _colValue + ']').text();
                    cu_label = $(this).find('[cu-code=' + _colLabel + ']').text();
                    $(tarId).attr('cu-value', cu_value);
                    $(tarId).attr('cu-label', cu_label);
                    $(tarId).find('font').text(cu_label);
                }
                
                if(typeof _callback == "function") {
                    _callback(cu_value)
                }
            }
        });		
    }
	
    const fn_payTermTest = async function() {
    	
    	const standardDay = SBUxMethod.get('srch-dtp-standardDay');
    	const payTermCode = gfn_nvl(gfnma_multiSelectGet("#srch-inp-payTermTest"));
    	
    	if (gfn_isEmpty(standardDay)) {
    		gfn_comAlert("W0001", "기준일자");		//	W0001	{0}을/를 선택하세요.
			return;
    	}
    	if (gfn_isEmpty(payTermCode)) {
    		gfn_comAlert("W0001", "지급조건");		//	W0001	{0}을/를 선택하세요.
			return;
    	}
    	
    	const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_PAY_TERM_CODE   : payTermCode,
                V_P_TXN_DATE        : standardDay,
                V_P_OUTPUT_TYPE     : '',
                V_P_BASE_CALC_TYPE  : '',
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
	
	    const postJsonPromiseForList = gfn_postJSON("/fi/ftr/tri/selectFim5150Q2List.do", {
	        getType				: 'json',
	        workType			: 'Q',
	        cv_count			: '1',
	        params				: gfnma_objectToString(paramObj)
	    });
	
		const listData = await postJsonPromiseForList;
	
		let expectedDate = "";
		
	    try {
	    	
			if (_.isEqual("S", listData.resultStatus)) {
	          	
				console.log("listData.cv_1", listData.cv_1);
	          	
				listData.cv_1.forEach((item, index) => {
					expectedDate = item.EXPECTED_DATE;
					return false;
	        	});
			}
		    
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e);
			console.error("failed", e.message);
		} finally {
	    	SBUxMethod.set('srch-inp-expectedDate', expectedDate);
	    }
	}
	

    const columns1 = [
        {
            caption: ["기간유형","수금,지급유형"],
            ref : 'TXN_TYPE',
            width : '120px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonTxnType',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기간유형","지급기준코드"],
            ref: 'PAY_TERM_CODE',
            type:'input',
            width:'120px',
            style:'text-align:left'
        },
        {
            caption: ["기간유형","지급기준명"],
            ref: 'PAY_TERM_NAME',
            type:'input',
            width:'120px',
            style:'text-align:left'
        },
        {
            caption: ["기간유형","사용여부"],
            ref: 'USE_YN',
            type:'checkbox',
            width:'120px',
            style:'text-align:center',
            typeinfo: {
                ignoreupdate : true,
                checkedvalue : 'Y',
                uncheckedvalue : 'N'
            }
        },
        {
            caption : ["일반기준","기산일기준"],
            ref : 'BASIS_TYPE',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonBasisType',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption : ["일반기준","기간유형"],
            ref : 'PERIOD_TYPE',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPeriodType',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption : ["일반기준","기산일 시작일기준"],
            ref : 'START_RULE',
            width : '150px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonStartRule',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기간유형","가산월"],
            ref: 'ADD_MONTH',
            type:'input',
            width:'70px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기간유형","가산일"],
            ref: 'ADD_DAY',
            type:'input',
            width:'70px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["일반기준","기준일수1"],
            ref : 'ADD_DAY1',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayRckDay',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },{
            caption : ["일반기준","기준일수2"],
            ref : 'ADD_DAY2',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayRckDay',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },{
            caption : ["기준일(특정일)","특정기준일1"],
            ref : 'STANDARD1_DAY',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayRckDay',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일(특정일)","특정일1보다 작을때 가산월"],
            ref: 'S1_ADD_MONTH',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일(특정일)","특정일1보다 작을때 가산일"],
            ref: 'S1_ADD_DAY',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일2 ","기준일2"],
            ref : 'STANDARD2_DAY',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayRckDay',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일2 ","기준일2보다 작을때 가산월"],
            ref: 'S2_ADD_MONTH',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일2 ","기준일2보다 작을때 가산일"],
            ref: 'S2_ADD_DAY',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일3 ","기준일3"],
            ref : 'STANDARD3_DAY',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayRckDay',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일3 ","기준일3보다 작을때 가산월"],
            ref: 'S3_ADD_MONTH',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일3 ","기준일3보다 작을때 가산일"],
            ref: 'S3_ADD_DAY',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일4 ","기준일4"],
            ref : 'STANDARD4_DAY',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayRckDay',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일4 ","기준일4보다 작을때 가산월"],
            ref: 'S4_ADD_MONTH',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일4 ","기준일4보다 작을때 가산일"],
            ref: 'S4_ADD_DAY',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일5 ","기준일5"],
            ref : 'STANDARD5_DAY',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayRckDay',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일5 ","기준일5보다 작을때 가산월"],
            ref: 'S5_ADD_MONTH',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일5 ","기준일5보다 작을때 가산일"],
            ref: 'S5_ADD_DAY',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["휴일제외기준일구분","휴일제외 기준일구분"],
            ref : 'STD_TYPE',
            width : '120px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonStdType',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption : ["지불방식 ","지급방법"],
            ref : 'PAY_METHOD',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonPayMethod',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["지불방식 ","적용가능지급조건"],
            ref: 'AVAIL_PAY_METHOD',
            type:'input',
            width:'120px',
            style:'text-align:center',
        },
        {
            caption: ["어음일수 ","어음일수"],
            ref: 'BILL_DAY',
            type:'input',
            width:'120px',
            style:'text-align:right',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["어음일수 ","어음-휴일기준"],
            ref : 'BILL_DUE_TYPE',
            width : '120px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonStdType',
                displayui : true,
                unselect: {label: '', value: ''},
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["비고","비고"],
            ref: 'memo',
            type:'input',
            width:'200px',
            style:'text-align:left',
        },

    ];

    const fn_createGrid = function(_mode) {

        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdPayDate';
        SBGridProperties.id = 'grdPayDate';
        SBGridProperties.jsonref = 'jsonPayDate';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.rowheader = ['update','select'];
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
        SBGridProperties.frozencols = 4; //고정열 지정
        
        SBGridProperties.columns = [];

        columns1.forEach((col) => {
            SBGridProperties.columns.push(col);
        });

        grdPayDate = _SBGrid.create(SBGridProperties);
        
        /*
        grdPayDate.bind('mouseleave',function() {
        	grdPayDate.stopEditing();
        });
        */
    }
    
	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		
        if (!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }
        
        
        const txnType = gfn_nvl(SBUxMethod.get('srch-slt-txnType'));				// 수금,지급구분
        const standardDate = gfn_nvl(SBUxMethod.get('srch-dtp-standardDate'));		// 기준일자
        const payPrprtnYmd = gfn_nvl(SBUxMethod.get('srch-inp-payPrprtnYmd'));		// 지급예정일
        const payTermCode = gfn_nvl(SBUxMethod.get('srch-inp-payTermCode'));		// 지급기준코드
        const payTermName = gfn_nvl(SBUxMethod.get('srch-inp-payTermName'));		// 지급기준명
        const payTerm = gfn_nvl(SBUxMethod.get('srch-inp-payTerm'));				// 지급조건
        
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_PAY_TERM_CODE	: payTermCode, 
                V_P_PAY_TERM_NAME	: payTermName,
                V_P_TXN_TYPE		: txnType,
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/tri/selectFim5150List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_1", listData.cv_1);
            	
            	jsonPayDate.length = 0;

                listData.cv_1.forEach((item, index) => {
                    const obj = {
                    		PAY_TERM_CODE: item.PAY_TERM_CODE,
                    		PAY_TERM_NAME: item.PAY_TERM_NAME,
                    		BASIS_TYPE: item.BASIS_TYPE,
                    		ADD_DAY: item.ADD_DAY,
                    		ADD_DAY1: item.ADD_DAY1,
                    		ADD_DAY2: item.ADD_DAY2,
                    		ADD_MONTH: item.ADD_MONTH,
                    		PERIOD_TYPE: item.PERIOD_TYPE,
                    		START_RULE: item.START_RULE,
                    		STANDARD1_DAY: item.STANDARD1_DAY,
                    		S1_ADD_DAY: item.S1_ADD_DAY,
                    		S1_ADD_MONTH: item.S1_ADD_MONTH,
                    		STANDARD2_DAY: item.STANDARD2_DAY,
                    		S2_ADD_DAY: item.S2_ADD_DAY,
                    		S2_ADD_MONTH: item.S2_ADD_MONTH,
                    		STANDARD3_DAY: item.STANDARD3_DAY,
                    		S3_ADD_DAY: item.S3_ADD_DAY,
                    		S3_ADD_MONTH: item.S3_ADD_MONTH,
                    		STANDARD4_DAY: item.STANDARD4_DAY,
                    		S4_ADD_DAY: item.S4_ADD_DAY,
                    		S4_ADD_MONTH: item.S4_ADD_MONTH,
                    		STANDARD5_DAY: item.STANDARD5_DAY,
                    		S5_ADD_DAY: item.S5_ADD_DAY,
                    		S5_ADD_MONTH: item.S5_ADD_MONTH,
                    		MEMO: item.MEMO,
                    		STD_TYPE: item.STD_TYPE,
                    		INSERT_USERID: item.INSERT_USERID,
                    		INSERT_TIME: item.INSERT_TIME,
                    		INSERT_PC: item.INSERT_PC,
                    		UPDATE_PC: item.UPDATE_PC,
                    		UPDATE_TIME: item.UPDATE_TIME,
                    		UPDATE_USERID: item.UPDATE_USERID,
                    		COMP_CODE: item.COMP_CODE,
                    		PAY_METHOD: item.PAY_METHOD,
                    		TXN_TYPE: item.TXN_TYPE,
                    		BILL_DAY: item.BILL_DAY,
                    		BILL_DUE_TYPE: item.BILL_DUE_TYPE,
                    		AVAIL_PAY_METHOD: item.AVAIL_PAY_METHOD,
                    		SAP_PAY_TERM: item.SAP_PAY_TERM,
                    		SAP_PAY_TERM_NAME: item.SAP_PAY_TERM_NAME,
                    		USE_YN: item.USE_YN,
                    }
                    
                    jsonPayDate.push(obj);
                    
                });
                
                grdPayDate.rebuild();
                
                if (jsonPayDate.length > 0) {
                	
                	if (_.isEqual(lv_mode, "rowcopy")) {
                		grdPayDate.setRow(2);	
                	} else {
                		grdPayDate.setRow(2);
                		grdPayDate.selectCell(2, 3);
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

 		const updatedData = grdPayDate.getUpdateData(true, 'all');
        const listData = [];

        for(const item of updatedData) {
        	
        	const compCode 		= gfn_nvl(item.data.COMP_CODE, gv_ma_selectedApcCd);
        	const clientCode 	= gfn_nvl(item.data.CLIENT_CODE, gv_ma_selectedClntCd);
        	const payTermCode 	= item.data.PAY_TERM_CODE;
        	const payTermName 	= item.data.PAY_TERM_NAME;
        	const basisType 	= gfn_nvl(item.data.BASIS_TYPE);
        	const addDay 		= parseInt(item.data.ADD_DAY) || 0;
        	const addMonth 		= parseInt(item.data.ADD_MONTH) || 0;
        	const periodType 	= gfn_nvl(item.data.PERIOD_TYPE);
        	const standard1Day 	= gfn_nvl(item.data.STANDARD1_DAY);
        	const s1AddDay 		= parseInt(item.data.S1_ADD_DAY) || 0;
        	const s1AddMonth 	= parseInt(item.data.S1_ADD_MONTH) || 0;
        	const memo 			= gfn_nvl(item.data.MEMO);
        	const stdType 		= gfn_nvl(item.data.STD_TYPE);
        	const payMethod 	= gfn_nvl(item.data.PAY_METHOD);
        	const txnType 		= gfn_nvl(item.data.TXN_TYPE);
        	const billDay 		= parseInt(item.data.BILL_DAY) || 0;
        	const billDueType 	= parseInt(item.data.BILL_DUE_TYPE) || 0;
        	const availPayMethod = gfn_nvl(item.data.AVAIL_PAY_METHOD);
        	const sapPayTerm 	= gfn_nvl(item.data.SAP_PAY_TERM);
        	const sapPayTermName = gfn_nvl(item.data.SAP_PAY_TERM_NAME);
        	const startRule 	= gfn_nvl(item.data.START_RULE);
        	const standard2Day 	= gfn_nvl(item.data.STANDARD2_DAY);
        	const s2AddDay 		= parseInt(item.data.S2_ADD_DAY) || 0;
        	const s2AddMonth 	= parseInt(item.data.S2_ADD_MONTH) || 0;
        	const standard3Day 	= gfn_nvl(item.data.STANDARD3_DAY);
        	const s3AddDay 		= parseInt(item.data.S3_ADD_DAY) || 0;
        	const s3AddMonth 	= parseInt(item.data.S3_ADD_MONTH) || 0;
        	const standard4Day 	= gfn_nvl(item.data.STANDARD4_DAY);
        	const s4AddDay 		= parseInt(item.data.S4_ADD_DAY) || 0;
        	const s4AddMonth 	= parseInt(item.data.S4_ADD_MONTH) || 0;
        	const standard5Day 	= gfn_nvl(item.data.STANDARD5_DAY);
        	const s5AddDay 		= parseInt(item.data.S5_ADD_DAY) || 0;
        	const s5AddMonth 	= parseInt(item.data.S5_ADD_MONTH) || 0;
        	const useYn 		= gfn_nvl(item.data.USE_YN);
        	const addDay1 		= parseInt(item.data.ADD_DAY1) || 0;
        	const addDay2 		= parseInt(item.data.ADD_DAY2) || 0;
        	
        	if (gfn_isEmpty(txnType)) {
				gfn_comAlert("W0005", "수금,지급유형");		//	W0005	{0}이/가 없습니다.
    			return;
        	}
        	
        	if (gfn_isEmpty(payTermCode)) {
        		gfn_comAlert("W0005", "지급기준코드");		//	W0005	{0}이/가 없습니다.
    			return;
        	}
        	
			if (gfn_isEmpty(payTermName)) {
				gfn_comAlert("W0005", "지급기준명");		//	W0005	{0}이/가 없습니다.
    			return;
        	}
			
			const param = {
	                cv_count: '0',
	                getType: 'json',
	                rownum: item.rownum,
	                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
	                params: gfnma_objectToString({
	                	V_P_DEBUG_MODE_YN: '',
	                	V_P_LANG_ID: '',
	                	V_P_COMP_CODE: compCode,
	                	V_P_CLIENT_CODE: clientCode,
	                	V_P_PAY_TERM_CODE: payTermCode,
	                	V_P_PAY_TERM_NAME: payTermName,
	                	V_P_BASIS_TYPE: basisType,
	                	V_P_ADD_DAY: addDay,
	                	V_P_ADD_MONTH: addMonth,
	                	V_P_PERIOD_TYPE: periodType,
	                	V_P_STANDARD1_DAY: standard1Day,
	                	V_P_S1_ADD_DAY: s1AddDay,
	                	V_P_S1_ADD_MONTH: s1AddMonth,
	                	V_P_MEMO: memo,
	                	V_P_STD_TYPE: stdType,
	                	V_P_PAY_METHOD: payMethod,
	                	V_P_TXN_TYPE: txnType,
	                	V_P_BILL_DAY: billDay,
	                	V_P_BILL_DUE_TYPE: billDueType,
	                	V_P_AVAIL_PAY_METHOD: availPayMethod,
	                	V_P_SAP_PAY_TERM: sapPayTerm,
	                	V_P_SAP_PAY_TERM_NAME: sapPayTermName,
	                	V_P_START_RULE: startRule,
	                	V_P_STANDARD2_DAY: standard2Day,
	                	V_P_S2_ADD_DAY: s2AddDay,
	                	V_P_S2_ADD_MONTH: s2AddMonth,
	                	V_P_STANDARD3_DAY: standard3Day,
	                	V_P_S3_ADD_DAY: s3AddDay,
	                	V_P_S3_ADD_MONTH: s3AddMonth,
	                	V_P_STANDARD4_DAY: standard4Day,
	                	V_P_S4_ADD_DAY: s4AddDay,
	                	V_P_S4_ADD_MONTH: s4AddMonth,
	                	V_P_STANDARD5_DAY: standard5Day,
	                	V_P_S5_ADD_DAY: s5AddDay,
	                	V_P_S5_ADD_MONTH: s5AddMonth,
	                	V_P_USE_YN: useYn,
	                	V_P_ADD_DAY1: addDay1,
	                	V_P_ADD_DAY2: addDay2,
	                	
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
 		
		const postJsonPromise = gfn_postJSON("/fi/ftr/tri/insertFim5150SList.do", {listData: listData});
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
            	gfn_comAlert("I0001");
                
            	await fn_search();
                
            	await fn_setPayTerm();
            	
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
     * @name fn_deletePayTerm
     * @description 삭제
     */
  	const fn_deletePayTerm = async function(rowIndex) {
		
  		if (rowIndex < 2){
  			return;
  		}
  		
  		const rowData = grdPayDate.getRowData(rowIndex);
  		const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gfn_nvl(rowData.COMP_CODE, gv_ma_selectedApcCd),
                V_P_CLIENT_CODE		: gfn_nvl(rowData.CLIENT_CODE, gv_ma_selectedClntCd),
                
                V_P_PAY_TERM_CODE	: rowData.PAY_TERM_CODE,
                V_P_PAY_TERM_NAME	: '',
                V_P_BASIS_TYPE		: '',
                V_P_ADD_DAY			: '',
                V_P_ADD_MONTH		: '',
                V_P_PERIOD_TYPE		: '',
                V_P_STANDARD1_DAY	: '',
                V_P_S1_ADD_DAY		: '',
                V_P_S1_ADD_MONTH	: '',
                V_P_MEMO			: '',
                V_P_STD_TYPE		: '',
                V_P_PAY_METHOD		: '',
                V_P_TXN_TYPE		: '',
                V_P_BILL_DAY		: '',
                V_P_BILL_DUE_TYPE	: '',
                V_P_AVAIL_PAY_METHOD: '',
                V_P_SAP_PAY_TERM	: '',
                V_P_SAP_PAY_TERM_NAME: '',
                V_P_START_RULE: '',
                V_P_STANDARD2_DAY: '',
                V_P_S2_ADD_DAY: '',
                V_P_S2_ADD_MONTH: '',
                V_P_STANDARD3_DAY: '',
                V_P_S3_ADD_DAY: '',
                V_P_S3_ADD_MONTH: '',
                V_P_STANDARD4_DAY: '',
                V_P_S4_ADD_DAY: '',
                V_P_S4_ADD_MONTH: '',
                V_P_STANDARD5_DAY: '',
                V_P_S5_ADD_DAY: '',
                V_P_S5_ADD_MONTH: '',
                V_P_USE_YN: '',
                V_P_ADD_DAY1: '',
                V_P_ADD_DAY2: '',
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	
        const postJsonPromise = gfn_postJSON("/fi/ftr/tri/insertFim5150S.do", {
            getType				: 'json',
            workType			: 'D',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        
        console.log("paramObj", paramObj);
    	
    	Object.keys(paramObj).forEach((key) => {
    		console.log("key", key, paramObj[key]);
    	});
    	
        
        const resoponseData = await postJsonPromise;
        
        try {
            if (_.isEqual("S", resoponseData.resultStatus)) {
            	gfn_comAlert("I0001");	// I0001	처리 되었습니다.

            	await fn_search();
                
            	await fn_setPayTerm();
            	
            } else {
                alert(resoponseData.resultMessage);
                return false;
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}
    
    // 행 추가
    const fn_addRow = function() {
    	
        const rowIndex = grdPayDate.getRow();

        if (rowIndex < 0){ //데이터가 없고 행선택이 없을경우.
        	grdPayDate.addRow(true);
        } else {
        	grdPayDate.insertRow(rowIndex);
        }
    }

    // 행삭제
    const fn_delRow = async function() {

    	const rowIndex = grdPayDate.getRow();
    	
    	if (rowIndex < 1) {
    		gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
    	}
    	
		const rowStatus = grdPayDate.getRowStatus(rowIndex);
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			await fn_deletePayTerm(rowIndex);

    	} else {
    		grdPayDate.deleteRow(rowIndex);
    	}

    }
    

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
