<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
</head>
<body oncontextmenu="return false">
	<section id="com5500Popup">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<colgroup>
							<col style="width:30%">
							<col style="width:70%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_bg">연락처그룹</th>
                                <td class="td_output" style="border-right: hidden;">
                                	<sbux-input id="SRCH_CONTACT_GROUP" class="form-control input-sm" uitype="text"></sbux-input>
                                </td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="box-body">
				<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
	            	<div id="sb-area-grid" style="width:930px;height:500px;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
			
		</div>
	</section>
</body>
<script >
 
var grid5500;
var grdList		= [];
var jsonContactGroup	= [];

/**
 * @description 공통 팝업
 */
function com5500Popup(options) {
	
	// id 선언
	var modalId  	= '#com5500Popup';
	var modalDivId 	= 'modal-com5500Popup';
	
	var settings = {
		contact_group			: null
		,comp_code				: null
		,client_code			: null
	};
	$.extend(settings, options);	
	console.log('settings:', settings);
 
    const setGridCombo = async function() {
        let rst = await Promise.all([
        	gfnma_setComSelect(['grid5500', 'CONTACT_GROUP'], jsonContactGroup, 'L_FBS026', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', '', ''),
        	SBUxMethod.set("SRCH_CONTACT_GROUP", settings.contact_group),
        ]);
    }
    
	//setGrid
    const setGrid = async function() {
		
	  	//기간별환율 탭 - 기간별환율등록
	    var SBGridProperties = {};
	    SBGridProperties.parentid 			= 'sb-area-grid';
	    SBGridProperties.id 				= 'grid5500';
	    SBGridProperties.jsonref 			= 'gridList';
	    SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
	    SBGridProperties.selectmode 		= 'free';
	    SBGridProperties.allowcopy 			= true; //복사
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};	    
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.columns = [
            {caption : ["연락처그룹"], ref : 'CONTACT_GROUP', width : '150px', style : 'text-align:center', type : 'combo', disabled : true,
                typeinfo : {
                    ref : 'jsonContactGroup',
                    label : 'label',
                    value : 'value'
                }
            },
	        {caption: ["사번"], 		ref: 'EMP_CODE', 		type: 'output', width: '80px',  style: 'text-align:left'},
	        {caption: ["사원명"], 	ref: 'EMP_NAME', 		type: 'output', width: '120px', style: 'text-align:left'},
	        {caption: ["메일주소"], 	ref: 'MAIL_ADDRESS', 	type: 'output', width: '200px', style: 'text-align:left'},
	        {caption: ["전화번호"], 	ref: 'TEL_NO', 			type: 'output', width: '150px', style: 'text-align:left'},
	        {caption: ["적요"], 		ref: 'DESCRIPTION', 	type: 'output', width: '100px', style: 'text-align:left'}
	    ];
	    grid5500 = _SBGrid.create(SBGridProperties);
	}
    
    function formatPhoneNumber(phoneNumber) {
        if (!/^\d{9,11}$/.test(phoneNumber) ) {
            return phoneNumber;
        }else if(_.isEmpty(phoneNumber)){
            return phoneNumber;
        }
        return phoneNumber.replace( /^(\d{2,3})(\d{3,4})(\d{4})$/, "$1-$2-$3" );
    }
    
	// get data
    const getData = async function() {
   		var paramObj = {
   			    V_P_DEBUG_MODE_YN        : ''
			    ,V_P_LANG_ID             : ''
			    ,V_P_COMP_CODE           : settings.comp_code
			    ,V_P_CLIENT_CODE         : settings.client_code
			    ,V_P_CONTACT_GROUP       : settings.contact_group
			    ,V_P_FORM_ID             : ''
			    ,V_P_MENU_ID             : ''
			    ,V_P_PROC_ID             : ''
			    ,V_P_USERID              : ''
			    ,V_P_PC                  : ''
   		};
    	const postJsonPromise = gfn_postJSON("/com/com5500tList.do", {
	        getType				: 'json',
	        workType			: 'Q',
	        cv_count			: '1',
	        params				: gfnma_objectToString(paramObj)
  		});
  	    const data = await postJsonPromise;
    	
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		gridList.length = 0;
	    	   	data.cv_1.forEach((item, index) => {
		    		const msg = {
		    				CONTACT_GROUP		: item.CTTPC_GRP,
		    				EMP_CODE			: item.EMP_CD,
		    				EMP_NAME			: item.EMP_NM,
		    				MAIL_ADDRESS		: item.EML_ADDR,
		    				TEL_NO				: formatPhoneNumber(gfnma_nvl2(item.TELNO)),
		    				TXN_ID				: item.TRSC_ID,
		    				DESCRIPTION			: item.DSCTN
		    		}
		    		gridList.push(msg);
		    	});
	    	   	grid5500.rebuild();

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
    };
    
    setGridCombo();
    setGrid();
    getData();
	
}
 
</script>
</html>
