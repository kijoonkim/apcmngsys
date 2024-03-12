<%
 /**
  * @Class Name : wrhsDsctnTotReg.jsp
  * @Description : 원물입고요약등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
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
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 입고집계등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnCmndDocDsctn"
						name="btnCmndDocDsctn"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_docRawMtrWrhs"
						text="입고확인서"
					></sbux-button>
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
						text="삭제"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
					></sbux-button>
                    <sbux-button
						id="btnReg"
						name="btnReg"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reg"
						text="등록"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">품목</th>
							<td colspan="3" class="td_input">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)"
								/>								
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdFrom"
									name="srch-dtp-wrhsYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdTo"
									name="srch-dtp-wrhsYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-prdcrNm"
									name="srch-btn-prdcrNm"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>

						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>입고내역집계</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button
							id="btnAddRow"
							name="btnAddRow"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_addRow"
							text="행추가"
						></sbux-button>
				    </div>
				</div>
				<div id="sb-area-grdWrhsSmmry" style="height:544px;">
				</div>
			</div>
		</div>
	</section>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>

<script type="text/javascript">

	var jsonApcItem			= [];	// 품목 		itemCd
	var jsonApcVrty			= [];	// 품종 		vrtyCd
	
	/** 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	window.addEventListener('DOMContentLoaded', async function(e) {
		fn_init();
	});
	
	const fn_init = async function() {

		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
		
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			fn_getPrdcrs(),
		]);
		
		
		fn_getApcVrty();
		fn_createWrhsDsctnTot();
		
		fn_search();
	}
	
	const fn_getApcVrty = async function() {
		
		jsonApcVrty.length = 0;
		const itemCd = SBUxMethod.get('srch-slt-itemCd');
		console.log("itemCd", itemCd);
		const json = await gfn_getApcVrty(gv_selectedApcCd, itemCd);
		
		if (!gfn_isEmpty(json)) {
			json.forEach((item) => {
				jsonApcVrty.push(item);
			});
		}
	}
	

	//그리드 id, 그리드 json
	var grdWrhsSmmry;
	var jsonWrhsSmmry = [];

	const fn_createWrhsDsctnTot = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWrhsSmmry';
	    SBGridProperties.id = 'grdWrhsSmmry';
	    SBGridProperties.jsonref = 'jsonWrhsSmmry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.columns = [
	    	{
				caption: [" ", " "], 		
				ref: 'itemCd',  
				type:'button',  
				width:'25px',    
				style:'text-align:center', 
				renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		        	if (gfn_isEmpty(strValue)) {
		        		return "<span style='cursor:pointer;' onclick='fn_delRow(" + nRow + ")'>❌</span>";
		        	} else {
		        		return "<span>🟢</span>";
		        	}
		    	}
			},
	    	{
	    		caption : ["",""],	
	    		ref : 'checkedYn',		
	    		width : '40px',	
	    		style : 'text-align:center',	
	    		type : 'checkbox',
	    		typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
	    	},
	    	{
	    		caption : ["구분","이름"], 
	    		ref: 'prdcrCd', 
	    		type: 'combo',  
	    		width:'100px', 
	    		style: 'text-align:center; padding-right:5px;',
	    		typeinfo: {
	    			ref:'jsonPrdcr', 
	    			label:'prdcrNm', 
	    			value:'prdcrCd', 
	    			oneclickedit: true,
	    			displayui : true
	    		}
	    	},
	    	
	    	// 빨강
	    	{
	    		caption : ["빨강","1차"], 
	    		ref: 'v1QnttCycl1', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v1Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["빨강","2차"], 
	    		ref: 'v1QnttCycl2', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v1Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["빨강","3차"], 
	    		ref: 'v1QnttCycl3', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v1Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["빨강","4차"], 
	    		ref: 'v1QnttCycl4', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v1Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["빨강","5차"], 
	    		ref: 'v1QnttCycl5', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v1Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["빨강","소계"], 
	    		ref: 'v1Qntt', 
	    		type: 'output',  
	    		width:'100px', 
	    		style: 'text-align:right; padding-right:5px;background-color:#ceebff;', 
	    		format : {type:'number', rule:'#,###'}, 
	    		fixedstyle : 'background-color:#ceebff;'
	    	},
	    	{
	    		caption : ["빨강","완료"], 
	    		ref: 'v1WrhsCmptnYn',
	    		type: 'checkbox',  
	    		width:'50px',
				style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			
			// 노랑
			{
	    		caption : ["노랑","1차"], 
	    		ref: 'v2QnttCycl1', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v2Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["노랑","2차"], 
	    		ref: 'v2QnttCycl2', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v2Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["노랑","3차"], 
	    		ref: 'v2QnttCycl3', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v2Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["노랑","4차"], 
	    		ref: 'v2QnttCycl4', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v2Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 6,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["노랑","5차"], 
	    		ref: 'v2QnttCycl5', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v2Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["노랑","소계"], 
	    		ref: 'v2Qntt', 
	    		type: 'output',  
	    		width:'100px', 
	    		style: 'text-align:right; padding-right:5px;background-color:#ceebff;', 
	    		format : {type:'number', rule:'#,###'}, 
	    		fixedstyle : 'background-color:#ceebff;'
	    	},
	    	{
	    		caption : ["노랑","완료"], 
	    		ref: 'v2WrhsCmptnYn', 
	    		type: 'checkbox',  
	    		width:'50px',
				style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			
			// 주황
			{
	    		caption : ["주황","1차"], 
	    		ref: 'v3QnttCycl1', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v3Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["주황","2차"], 
	    		ref: 'v3QnttCycl2', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v3Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["주황","3차"], 
	    		ref: 'v3QnttCycl3', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v3Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 6,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["주황","4차"], 
	    		ref: 'v3QnttCycl4', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v3Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["주황","5차"], 
	    		ref: 'v3QnttCycl5', 
	    		type: 'input',  
	    		width:'50px', 
	    		style: 'text-align:right; padding-right:5px;', 
	    		format : {type:'number', rule:'#,###'},
	    		userattr: {colNm: "v3Qntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 10,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
	    	},
	    	{
	    		caption : ["주황","소계"], 
	    		ref: 'v3Qntt', 
	    		type: 'output',  
	    		width:'100px', 
	    		style: 'text-align:right; padding-right:5px;background-color:#ceebff;', 
	    		format : {type:'number', rule:'#,###'}, 
	    		fixedstyle : 'background-color:#ceebff;'
	    	},
	    	{
	    		caption : ["주황","완료"], 
	    		ref: 'v3WrhsCmptnYn',
	    		type: 'checkbox',  
	    		width:'50px',
				style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			
	    	{
				caption : ["합계","합계"], 
				ref: 'qntt', 
				type: 'output',  
				width:'150px', 
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
	    	{
				caption : ["비고","비고"], 
				ref: 'rmrk', 
				type: 'input',  
				width:'50px', 
				style: 'text-align:right; padding-right:5px;'
			},
	    	{caption: ["입고시작일자"],	ref: 'wrhsBgngYmd',     	type:'input',  	hidden: true},
	    	{caption: ["입고종료일자"],	ref: 'wrhsEndYmd',     		type:'input',  	hidden: true},
	    	{caption: ["생산자코드"],		ref: 'prdcrCd',     		type:'input',  	hidden: true}

	    ];
		
	    grdWrhsSmmry = _SBGrid.create(SBGridProperties);
	    grdWrhsSmmry.bind('valuechanged', fn_grdWrhsSmmryValueChanged);
        grdWrhsSmmry.setCellStyles(0,3,0,7,'background:#FF0000;color:white;font-size:24px;');
        grdWrhsSmmry.setCellStyles(0,8,0,13,'background:#FFFC33;font-size:24px;');
        grdWrhsSmmry.setCellStyles(0,14,0,19,'background:#FFB533;font-size:24px;');
	}


	// 입고구분
	const fn_setGrdWrhsSmmry = async function() {
		
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		
		const param = {
			apcCd: gv_selectedApcCd,
			wrhsBgngYmd: wrhsYmdFrom,
			wrhsEndYmd: wrhsYmdTo,
			itemCd: itemCd
		}
		
		let totalRecordCount = 0;
		try {
			const postUrl = "/am/wrhs/selectRawMtrWrhsSmmryTotalList.do";
			const postJsonPromise = gfn_postJSON(postUrl, param);
	        const data = await postJsonPromise;
	        
	        if (!_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		return;
        	}
	        
	        data.resultList.forEach((item, index) => {
	        	jsonWrhsSmmry.push(item);
	        });

	        grdWrhsSmmry.refresh();


		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_save = async function() {
		
		const rawMtrWrhsSmmryList = [];

		const allData = grdWrhsSmmry.getGridDataAll();
		
		for ( let i=0; i<allData.length; i++ ) {
			const rowData = allData[i];
			
			if (gfn_isEmpty(rowData.prdcrCd)) {
				continue;
			}
			
			rawMtrWrhsSmmryList.push(rowData);
		}
		
		if (rawMtrWrhsSmmryList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		
		const wrhsBgngYmd = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		const wrhsEndYmd = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		
		console.log("itemCd", itemCd);
		
		const rawMtrWrhsMngVO = {
			apcCd: gv_selectedApcCd,
			wrhsBgngYmd: wrhsBgngYmd,
			wrhsEndYmd: wrhsEndYmd,
			itemCd: itemCd,
    		rawMtrWrhsSmmryList: rawMtrWrhsSmmryList
		}
		
		for ( let i = 1; i <= 5; i++ ) {
			if (i <= jsonApcVrty.length) {
				rawMtrWrhsMngVO['vrtyCd' + i] = jsonApcVrty[i - 1].vrtyCd;
			}
		}
		
		try {
			const postUrl = "/am/wrhs/insertRawMtrWrhsSmmry.do";
    		const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhsMngVO);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        	
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}
	
	
	const fn_delete = async function() {
		
		const rawMtrWrhsSmmryList = [];

		const allData = grdWrhsSmmry.getGridDataAll();
		
		let cntTemp = 0;
		const rowList = []
		
		for ( let i=0; i<allData.length; i++ ) {
			
			const rowData = allData[i];
			if (rowData.checkedYn === "Y") {				
				if (gfn_isEmpty(rowData.itemCd)) {
					rowList.push(i+2);
				} else {
					rawMtrWrhsSmmryList.push(rowData);
				}
			}
		}
		
		if (rawMtrWrhsSmmryList.length == 0 && rowList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		
		if (rowList.length > 0) {
			rowList.forEach((nRow) => {
				grdWrhsSmmry.deleteRow(nRow);
			});
			
			if (rawMtrWrhsSmmryList.length == 0) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.	
			}
		}
		
		if (rawMtrWrhsSmmryList.length > 0) {
			const rawMtrWrhsMngVO = {
					apcCd: gv_selectedApcCd,
		    		rawMtrWrhsSmmryList: rawMtrWrhsSmmryList
				}
				
			try {
				const postUrl = "/am/wrhs/deleteRawMtrWrhsSmmry.do";
	    		const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhsMngVO);
				const data = await postJsonPromise;

	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
	        	}
	        	
	        } catch(e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
		}
		
	}
	
    /**
     * @name fn_search
     * @description 조회 버튼
     */
	const fn_search = async function() {
    	
		jsonWrhsSmmry.length = 0;
		fn_setGrdWrhsSmmry();
	}
	
	
	const fn_dtpChange = function(){
		
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
		
		fn_search();
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

     // 엑셀 다운로드
     function fn_excelDwnld() {
    	 grdWrhsSmmry.exportLocalExcel("입고내역집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    	 //grdWrhsSmmry.exportData("xlsx", "입고내역집계", true, {combolabel: true, sheetName: "temp"});
    	 
     }

     /**
      * @name fn_docWrhsDsctnTot
      * @description 입고집계내역 발행 버튼
      */
 	const fn_docWrhsDsctnTot = function() {

 		const grdWrhsDsctnTotList = [];
 		const allData = grdWrhsDsctnTot.getGridDataAll();
 		allData.forEach((item, index) => {
 			if (item.checkedYn === "yes") {
 					grdWrhsDsctnTotList.push(
 						item.prdcrCd
 						, item.wrhsYmd
 					);
 				}

 		});
 		if (grdWrhsDsctnTotList.length === 0) {
 			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
 			return;
 		}
 		const list = grdWrhsDsctnTotList.join("','");

 		gfn_popClipReport("입고확인서", "am/popWrhsDsctnTot.crf", {apcCd: gv_selectedApcCd, prdcrCd : grdWrhsDsctnTotList[0] , wrhsYmd : grdWrhsDsctnTotList[1]});
 	}

 	/**
     * @name fn_addRow
     * @description 행 추가 버튼
     */
 	const fn_addRow = function(){
 		let prdcrNm = SBUxMethod.get("srch-inp-prdcrNm");
 		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
 		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdTo");
 		
 		//grdWrhsSmmry.addRow(true,{'wrhsYmd':wrhsYmdFrom,'prdcrNm':prdcrNm,'prdcrCd':prdcrCd});
 		grdWrhsSmmry.addRow(true);
 	}
 	
 	const fn_delRow = function(nRow) {
 		grdWrhsSmmry.deleteRow(nRow);
 	}

 	const fn_grdWrhsSmmryValueChanged = function() {
 		
 		let nRow = grdWrhsSmmry.getRow();
    	let nCol = grdWrhsSmmry.getCol();
    	
		const usrAttr = grdWrhsSmmry.getColUserAttr(nCol);
		
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
			
			const rowData = grdWrhsSmmry.getRowData(nRow, false);	// deep copy
			
			switch (usrAttr.colNm) {
				case "v1Qntt":
					
					let v1Qntt = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const qntt = parseInt(rowData["v1QnttCycl" + i]) || 0;
						v1Qntt += qntt;
					}
					
					rowData.v1Qntt = v1Qntt;
					
					rowData.qntt = 
						(parseInt(rowData.v1Qntt) || 0)
						+ (parseInt(rowData.v2Qntt) || 0)
						+ (parseInt(rowData.v3Qntt) || 0)
						+ (parseInt(rowData.v4Qntt) || 0)
						+ (parseInt(rowData.v5Qntt) || 0);
					
					break;
					
				case "v2Qntt":
					
					let v2Qntt = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const qntt = parseInt(rowData["v2QnttCycl" + i]) || 0;
						v2Qntt += qntt;
					}
					
					rowData.v2Qntt = v2Qntt;
					
					rowData.qntt = 
						(parseInt(rowData.v1Qntt) || 0)
						+ (parseInt(rowData.v2Qntt) || 0)
						+ (parseInt(rowData.v3Qntt) || 0)
						+ (parseInt(rowData.v4Qntt) || 0)
						+ (parseInt(rowData.v5Qntt) || 0);
					
					break;
					
				case "v3Qntt":
					
					let v3Qntt = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const qntt = parseInt(rowData["v3QnttCycl" + i]) || 0;
						v3Qntt += qntt;
					}
					
					rowData.v3Qntt = v3Qntt;
					
					rowData.qntt = 
						(parseInt(rowData.v1Qntt) || 0)
						+ (parseInt(rowData.v2Qntt) || 0)
						+ (parseInt(rowData.v3Qntt) || 0)
						+ (parseInt(rowData.v4Qntt) || 0)
						+ (parseInt(rowData.v5Qntt) || 0);
					
					break;
					
				case "v4Qntt":
					
					let v4Qntt = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const qntt = parseInt(rowData["v4QnttCycl" + i]) || 0;
						v4Qntt += qntt;
					}
					
					rowData.v4Qntt = v4Qntt;
					
					rowData.qntt = 
						(parseInt(rowData.v1Qntt) || 0)
						+ (parseInt(rowData.v2Qntt) || 0)
						+ (parseInt(rowData.v3Qntt) || 0)
						+ (parseInt(rowData.v4Qntt) || 0)
						+ (parseInt(rowData.v5Qntt) || 0);
					
					break;
					
				case "v5Qntt":
					
					let v5Qntt = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const qntt = parseInt(rowData["v5QnttCycl" + i]) || 0;
						v4Qntt += qntt;
					}
					
					rowData.v5Qntt = v5Qntt;
					
					rowData.qntt = 
						(parseInt(rowData.v1Qntt) || 0)
						+ (parseInt(rowData.v2Qntt) || 0)
						+ (parseInt(rowData.v3Qntt) || 0)
						+ (parseInt(rowData.v4Qntt) || 0)
						+ (parseInt(rowData.v5Qntt) || 0);
					
					break;
			
				case "v1Wght":
					
					let v1Wght = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const wght = parseFloat(rowData["v1WghtCycl" + i]) || 0;
						v1Wght += wght;
					}
					
					rowData.v1Wght = v1Wght;
					
					break;
					
				case "v2Wght":
					
					let v2Wght = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const wght = parseFloat(rowData["v2WghtCycl" + i]) || 0;
						v2Wght += wght;
					}
					
					rowData.v2Wght = v2Wght;
					
					break;
					
				case "v3Wght":
					
					let v3Wght = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const wght = parseFloat(rowData["v3WghtCycl" + i]) || 0;
						v3Wght += wght;
					}
					
					rowData.v3Wght = v3Wght;
					
					break;
					
				case "v4Wght":
					
					let v4Wght = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const wght = parseFloat(rowData["v4WghtCycl" + i]) || 0;
						v4Wght += wght;
					}
					
					rowData.v4Wght = v4Wght;
					
					break;
					
				case "v5Wght":
					
					let v5Wght = 0;
					for ( let i = 1; i <= 5; i++ ) {
						const wght = parseFloat(rowData["v5WghtCycl" + i]) || 0;
						v4Wght += wght;
					}
					
					rowData.v5Wght = v5Wght;
					
					break;
			}
			
			grdWrhsSmmry.refresh();
		}
 		
 		
 	}
 	
 	const fn_setPrdcrForm = async function(prdcr) {
		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}
	}

 	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }
	
	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}
	
	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}
	
 	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {

		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}

	/**
     * @name fn_docRawMtrWrhs
     * @description 입고확인서 발행 버튼
     */
	const fn_docRawMtrWrhs = async function() {

		const rawSmmryList = [];
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'RTR_DOC');
		const allData = grdWrhsSmmry.getGridDataAll();
		let wrhsBgngYmd = SBUxMethod.get("srch-dtp-wrhsYmdFrom");		// 입고시작일자
   		let wrhsEndYmd = SBUxMethod.get("srch-dtp-wrhsYmdTo");		// 입고종료일자
   		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
					rawSmmryList.push(
						item.prdcrCd
					);
				}

		});
		if (rawSmmryList.length === 0) {
			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
			return;
		}


		gfn_popClipReport("입고확인서", rptUrl, {apcCd: gv_selectedApcCd, wrhsBgngYmd : wrhsBgngYmd,wrhsEndYmd : wrhsEndYmd   });

	}

</script>
</html>