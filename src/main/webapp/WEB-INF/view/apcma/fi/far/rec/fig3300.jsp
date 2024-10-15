<%
/**
 * @Class Name 		: fig3300.jsp
 * @Description 	: 전자세금계산서 관리(매출) 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.05
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.05   	이경한		최초 생성
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
	<title>title : 전자세금계산서 관리(매출)</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 전자세금계산서 관리(매출) -->
                </div>
				<div style="margin-left: auto;">
					<sbux-button id="btnXml" name="btnXml" uitype="normal" class="btn btn-sm btn-outline-danger" text="파일등록(XML)" onclick="$('#xmlFile').click()"></sbux-button>
					<sbux-button id="btnDisconnection" name="btnDisconnection" uitype="normal" class="btn btn-sm btn-outline-danger" text="전표연결 끊기" onclick="fn_disconnection"></sbux-button>
					<sbux-button id="btnImport" name="btnImport" uitype="normal" class="btn btn-sm btn-outline-danger" text="불러오기" onclick="fn_import"></sbux-button>
					<sbux-button id="btnExcelUpload" name="btnExcelUpload" uitype="normal" class="btn btn-sm btn-outline-danger" text="전자세금계산서" onclick="$('#excelFile').click()"></sbux-button>
					<sbux-button id="btnUpload2" name="btnUpload2" uitype="normal" class="btn btn-sm btn-outline-danger" text="전자계산서" onclick="$('#excelFile2').click()"></sbux-button>
				</div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 1%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row" class="th_bg">사업단위</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<div class="dropdown">
									<button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<font>선택</font>
										<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
									</div>
								</div>
							</td>
							<th scope="row" class="th_bg">조회구분</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio id="rdo_norm1" name="SRCH_RIDGUBUN" uitype="normal" text="전체" value="99"></sbux-radio>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo_norm2" name="SRCH_RIDGUBUN" uitype="normal" text="세금계산서" value="20"></sbux-radio>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo_norm3" name="SRCH_RIDGUBUN" uitype="normal" text="계산서" value="10"></sbux-radio>
								</p>
								<sbux-input id="SRCH_AMT" name="SRCH_AMT" uitype="hidden"></sbux-input>
								<sbux-input id="SRCH_APPROVAL_NO" name="SRCH_APPROVAL_NO" uitype="hidden"></sbux-input>
								<sbux-input id="SRCH_ROW_CNT" name="SRCH_ROW_CNT" uitype="hidden"></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">년월</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_PERIOD_YYYYMM"
										name="SRCH_PERIOD_YYYYMM"
										date-format="yyyy-mm"
										datepicker-mode="month"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
										style="width:100%;"
								/>
							</td>
							<th scope="row" class="th_bg">사업자번호</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input id="SRCH_CS_BIZ_REGNO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						 <tr>
							<th scope="row" class="th_bg">작성일자</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_DATE_FR"
										name="SRCH_DATE_FR"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
										style="width:100%;"
								/>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<span> ~ </span>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_DATE_TO"
										name="SRCH_DATE_TO"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
										style="width:100%;"
								/>
							</td>
							<th scope="row" class="th_bg">상호</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input id="SRCH_CS_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
							</td>
							 <th scope="row" class="th_bg">담당자</th>
							 <td class="td_input" style="border-right:hidden;">
								 <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
							 </td>
							 <td class="td_input" style="border-right:hidden;">
								 <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
							 </td>
							 <td class="td_input" style="border-right:hidden;">
								 <sbux-button
										 class="btn btn-xs btn-outline-dark"
										 text="찾기" uitype="modal"
										 target-id="modal-compopup1"
										 onclick="fn_findEmpCode"
								 ></sbux-button>
							 </td>
						</tr>
                    </tbody>
                </table>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>조회 결과</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">
							<sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="제외처리 취소" class="btn btn-sm btn-outline-danger" onclick="fn_cancel" style="float: right;"></sbux-button>
							<sbux-button id="btnExclusion" name="btnExclusion" uitype="normal" text="제외처리" class="btn btn-sm btn-outline-danger" onclick="fn_exclusion" style="float: right;"></sbux-button>
							<sbux-input id="EXCEPT_REASON" uitype="text" placeholder="" class="form-control input-sm" style="float: right; margin-right: 5px;"></sbux-input>
							<div class="dropdown" style="float: right; width: 10%; margin-right: 5px;">
								<button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="EXCEPT_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<font>선택</font>
									<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
								</button>
								<div class="dropdown-menu" aria-labelledby="EXCEPT_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
								</div>
							</div>
							<span style="float: right;">제외사유</span>
						</div>
					</div>
					<div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
						<div id="sb-area-gvwList" style="height:350px;"></div>
					</div>
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li><span>품목</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-gvwItem" style="height:350px;"></div>
					</div>
				</div>
				<input type="file" name="file" id="xmlFile" accept="text/xml" style="display: none;" multiple>
				<input type="file" name="file" id="excelFile" accept=".xls,.xlsx" style="display: none;">
				<input type="file" name="file" id="excelFile2" accept=".xls,.xlsx" style="display: none;">
            </div>
        </div>
    </section>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:800px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
</body>

<!-- inline scripts related to this page -->
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
<script type="text/javascript">

	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	//-----------------------------------------------------------

	var editType			= "N";
	var strjob_name = "IF_EC_FI_002";
	var strIfType = "1";

	var jsonExceptCode = []; // 제외코드
	var jsonEinvoiceCategory = []; // 전자세금계산서분류
	var jsonEinvoiceType = []; // 전자세금계산서종류
	var jsonMatchMethod = []; // 정발행/역발행
	var jsonReceiptOrBill = []; // 영수/청구 구분
	var jsonCostCenterCode = []; // 원가중심점코드
	var jsonEmpState = []; // 재직구분

	//grid 초기화
	var gvwList; 			// 그리드를 담기위한 객체 선언
	var gvwItem;

	var jsonSearchResultList = []; 	// 그리드의 참조 데이터 주소 선언
	var jsonItemList = [];

	const fn_initSBSelect = async function() {
		SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
		SBUxMethod.set("SRCH_DATE_FR",gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("SRCH_DATE_TO", gfn_dateLastYmd(new Date()));
		SBUxMethod.set("SRCH_RIDGUBUN", "99");
		gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);


		let rst = await Promise.all([
			// 사업단위
			gfnma_multiSelectInit({
				target			: ['#SRCH_FI_ORG_CODE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM022'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'FI_ORG_CODE'
				,colLabel		: 'FI_ORG_NAME'
				,columns		:[
					{caption: "코드",		ref: 'FI_ORG_CODE', 			width:'150px',  	style:'text-align:left'},
					{caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			// 제외사유
			gfnma_setComSelect(['gvwList'], jsonExceptCode, 'L_FIM251', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CODE', 'NAME', 'Y', ''),
			gfnma_multiSelectInit({
				target			: ['#EXCEPT_CODE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM251'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'CODE'
				,colLabel		: 'NAME'
				,columns		:[
					{caption: "제외사유",		ref: 'CODE', 			width:'150px',  	style:'text-align:left'},
					{caption: "제외내용", 		ref: 'NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			// 전자세금계산서분류
			gfnma_setComSelect(['gvwList'], jsonEinvoiceCategory, 'L_FIG3100', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 전자세금계산서종류
			gfnma_setComSelect(['gvwList'], jsonEinvoiceType, 'L_FIG3100_TYPE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 정발행/역발행
			gfnma_setComSelect(['gvwList'], jsonMatchMethod, 'L_FIT005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 영수/청구 구분
			gfnma_setComSelect(['gvwList'], jsonReceiptOrBill, 'L_FIT042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 원가중심점코드
			gfnma_setComSelect(['gvwItem'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
			// 재직구분
			gfnma_setComSelect([''], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}

	function fn_createGvwListGrid()  {
		var SBGridProperties 				= {};
		SBGridProperties.parentid 			= 'sb-area-gvwList';
		SBGridProperties.id 				= 'gvwList';
		SBGridProperties.jsonref 			= 'jsonSearchResultList';
		SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
		SBGridProperties.allowcopy = true; //복사
		SBGridProperties.frozencols = 4;
		/*		SBGridProperties.frozenbottomrows = 1;
                SBGridProperties.total = {
                    type 		: 'grand',
                    position	: 'bottom',
                    columns		: {
                        standard : [3],
                        sum : [23, 24, 25, 26, 27, 28],
                        count : [3]
                    },
                    datasorting	: true,
                    usedecimal : false,
                };*/
		SBGridProperties.extendlastcol 		= 'scroll';
		SBGridProperties.columns = [
			{caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'38px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
			{caption: ["전표작성"],			    ref: 'INTERFACED_FLAG', 			        type:'checkbox',  	width:'75px',  	style:'text-align:center',
				typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["작성일자"],       ref: 'WRITE_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
				typeinfo: {dateformat: 'yyyy-mm-dd'},
				format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
				, disabled: true
			},
			{caption: ["승인번호"],         ref: 'APPROVAL_NO',    type:'output',  	width:'189px',  style:'text-align:left'},
			{caption: ["발급일자"],       ref: 'ISSUE_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
				typeinfo: {dateformat: 'yyyy-mm-dd'},
				format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
				, disabled: true
			},
			{caption: ["전송일자"],       ref: 'SEND_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
				typeinfo: {dateformat: 'yyyy-mm-dd'},
				format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
				, disabled: true
				, hidden: true
			},
			{caption: ["공급자사업자번호"],         ref: 'SELLER_REG_NO',    type:'output',  	width:'120px',  style:'text-align:left',
				typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 10}
				, format : {type:'number', rule:'###-##-#####', emptyvalue:'0'}
			},
			{caption: ["종사업장번호"],         ref: 'SELLER_SUB_REG_NO',    type:'output',  	width:'88px',  style:'text-align:left'},
			{caption: ["구분"],         ref: 'RID_GUBUN',    type:'output',  	width:'80px',  style:'text-align:left'},
			{caption: ["DOC_ID"],         ref: 'DOC_ID',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
			{caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
			{caption: ["배치번호"],         ref: 'DOC_BATCH_NO',    type:'output',  	width:'160px',  style:'text-align:left'},
			{caption: ["거래처코드"],         ref: 'CS_CODE',    type:'output',  	width:'90px',  style:'text-align:left'},
			{caption: ["상호"],         ref: 'SELLER_NAME',    type:'output',  	width:'106px',  style:'text-align:left'},
			{caption: ["대표자명"],         ref: 'SELLER_OWNER',    type:'output',  	width:'75px',  style:'text-align:left'},
			{caption: ["공급자주소"],         ref: 'SELLER_ADDRESS',    type:'output',  	width:'138px',  style:'text-align:left'},
			{caption: ["공급받는자사업자번호"],         ref: 'BUYER_REG_NO',    type:'output',  	width:'150px',  style:'text-align:left',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 10}
				, format : {type:'number', rule:'###-##-#####', emptyvalue:'0'}
			},
			{caption: ["종사업자번호"],         ref: 'BUYER_SUB_REG_NO',    type:'output',  	width:'88px',  style:'text-align:left',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 10}
				, format : {type:'number', rule:'###-##-#####', emptyvalue:'0'}
			},
			{caption: ["구매자상호"],         ref: 'BUYER_NAME',    type:'output',  	width:'112px',  style:'text-align:left'},
			{caption: ["공급자업종"],         ref: 'SELLER_BIZ_CATEGORY',    type:'output',  	width:'75px',  style:'text-align:left'},
			{caption: ["공급자업태"],         ref: 'SELLER_BIZ_ITEM',    type:'output',  	width:'75px',  style:'text-align:left'},
			{caption: ["구매자대표자명"],         ref: 'BUYER_OWNER',    type:'output',  	width:'101px',  style:'text-align:left'},
			{caption: ["구매자주소"],         ref: 'BUYER_ADDRESS',    type:'output',  	width:'174px',  style:'text-align:left'},
			{caption: ["합계금액"],         ref: 'TOTAL_AMT',    type:'output',  	width:'116px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["공급가액"],         ref: 'TOTAL_TAXABLE_AMT',    type:'output',  	width:'105px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["세액"],         ref: 'TOTAL_VAT_AMT',    type:'output',  	width:'106px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["전표총금액"],         ref: 'DOC_TOTAL_AMT',    type:'output',  	width:'111px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["전표공급가액"],         ref: 'DOC_SUPPLY_AMT',    type:'output',  	width:'102px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["전표부가세"],         ref: 'DOC_VAT_AMT',    type:'output',  	width:'105px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["차이여부"],			    ref: 'DIFF_FLAG', 			        type:'checkbox',  	width:'75px',  	style:'text-align:center',
				typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["구매자업종"],         ref: 'BUYER_BIZ_CATEGORY',    type:'output',  	width:'114px',  style:'text-align:left'},
			{caption: ["구매자업태"],         ref: 'BUYER_BIZ_ITEM',    type:'output',  	width:'111px',  style:'text-align:left'},
			{caption: ["구매자유형"],         ref: 'BUYER_BIZ_TYPE',    type:'output',  	width:'75px',  style:'text-align:left'},
			{caption: ["제외코드"], 		ref: 'EXCEPT_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
				typeinfo: {
					ref			: 'jsonExceptCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
				}
				, disabled: true
			},
			{caption: ["제외사유"],         ref: 'EXCEPT_REASON',    type:'output',  	width:'130px',  style:'text-align:left'},
			{caption: ["전자세금계산서분류"], 		ref: 'EINVOICE_CATEGORY',   	    type:'combo', style:'text-align:left' ,width: '120px',
				typeinfo: {
					ref			: 'jsonEinvoiceCategory',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
				}
				, disabled: true
			},
			{caption: ["전자세금계산서종류"], 		ref: 'EINVOICE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '120px',
				typeinfo: {
					ref			: 'jsonEinvoiceType',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
				}
				, disabled: true
			},
			{caption: ["정발행/역발행"], 		ref: 'MATCH_METHOD',   	    type:'combo', style:'text-align:left' ,width: '120px',
				typeinfo: {
					ref			: 'jsonMatchMethod',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
				}
				, disabled: true
			},
			{caption: ["발급유형"],         ref: 'ISSUE_TYPE',    type:'output',  	width:'75px',  style:'text-align:left'},
			{caption: ["비고"],         ref: 'NOTE1',    type:'output',  	width:'155px',  style:'text-align:left'},
			{caption: ["OTHER_DESC"],         ref: 'NOTE2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["영수/청구 구분"], 		ref: 'RECEIPT_OR_BILL',   	    type:'combo', style:'text-align:left' ,width: '90px',
				typeinfo: {
					ref			: 'jsonReceiptOrBill',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
				}
				, disabled: true
			},
			{caption: ["공급자이메일"],         ref: 'SELLER_EMAIL',    type:'output',  	width:'125px',  style:'text-align:left'},
			{caption: ["구매자이메일1"],         ref: 'BUYER_EMAIL1',    type:'output',  	width:'121px',  style:'text-align:left'},
			{caption: ["구매자이메일2"],         ref: 'BUYER_EMAIL2',    type:'output',  	width:'109px',  style:'text-align:left'},
			{caption: ["품목일자"],       ref: 'TXN_DATE', 		type:'datepicker',  	width:'87px',  	style:'text-align:left',
				typeinfo: {dateformat: 'yyyy-mm-dd'},
				format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
				, disabled: true
			},
			{caption: ["품목명"],         ref: 'ITEM_NAME',    type:'output',  	width:'157px',  style:'text-align:left', hidden: true},
			{caption: ["품목규격"],         ref: 'ITEM_SPEC',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["품목수량"],         ref: 'ITEM_QTY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["품목단가"],         ref: 'ITEM_UNIT_PRICE',    type:'output',  	width:'86px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
				, hidden: true
			},
			{caption: ["품목공급가액"],         ref: 'ITEM_TAXABLE_AMT',    type:'output',  	width:'93px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
				, hidden: true
			},
			{caption: ["품목가액"],         ref: 'ITEM_VAT_AMT',    type:'output',  	width:'93px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
				, hidden: true
			},
			{caption: ["품목비고"],         ref: 'ITEM_DESC',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["전표담당자코드"],         ref: 'ACCOUNT_EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
			{caption: ["전표담당자"],         ref: 'ACCOUNT_EMP_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
			{caption: ["상태"],         ref: 'ROW_STATUS',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["회계단위"],         ref: 'FI_ORG_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["조회시공급사코드"],         ref: 'CS_CODE_ORG',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
		];

		gvwList = _SBGrid.create(SBGridProperties);
		gvwList.bind('afterrebuild','fn_gvwListAfterRebuild');
		gvwList.bind('afterrefresh','fn_gvwListAfterRebuild');
		gvwList.bind('dblclick', 'fn_gvwListDblclick');
		gvwList.bind('click', 'fn_view');
	}

	function fn_createGvwItemGrid() {
		var SBGridProperties 				= {};
		SBGridProperties.parentid 			= 'sb-area-gvwItem';
		SBGridProperties.id 				= 'gvwItem';
		SBGridProperties.jsonref 			= 'jsonItemList';
		SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
		SBGridProperties.allowcopy = true; //복사
		SBGridProperties.extendlastcol 		= 'scroll';
		SBGridProperties.columns = [
			{caption: ["승인번호"],         ref: 'APPROVAL_NO',    type:'output',  	width:'190px',  style:'text-align:left'},
			{caption: ["품목순번"],         ref: 'SEQ',    type:'output',  	width:'60px',  style:'text-align:left'},
			{caption: ["품목명"],         ref: 'ITEM_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
			{caption: ["규격"],         ref: 'ITEM_SPEC',    type:'output',  	width:'100px',  style:'text-align:left'},
			{caption: ["품목수량"],         ref: 'ITEM_QTY',    type:'output',  	width:'70px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["품목단가"],         ref: 'ITEM_UNIT_PRICE',    type:'output',  	width:'70px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["품목공급가액"],         ref: 'ITEM_TAXABLE_AMT',    type:'output',  	width:'100px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["품목세액"],         ref: 'ITEM_VAT_AMT',    type:'output',  	width:'100px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
				, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["비고"],         ref: 'ITEM_DESC',    type:'output',  	width:'100px',  style:'text-align:left'},
			{caption: ["원가중심점코드"], 		ref: 'COST_CENTER_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
				typeinfo: {
					ref			: 'jsonCostCenterCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
				}
				, disabled: true
			},
			{caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["부서"],       ref: 'DEPT_NAME', 		type:'output',  	width:'75px',  	style:'text-align:left'},
			{caption: ["프로젝트코드"],         ref: 'PROJECT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["프로젝트"],         ref: 'PROJECT_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
			{caption: ["계정과목코드"],         ref: 'ACCOUNT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
			{caption: ["계정과목"],         ref: 'ACCOUNT_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
		];

		gvwItem = _SBGrid.create(SBGridProperties);
		gvwItem.bind('dblclick', 'fn_gvwItemDblclick');
	}

	const fn_gvwListAfterRebuild = async function() {
		let gvwListData = gvwList.getGridDataAll();

		for(var i = 0; i < gvwListData.length; i++) {
			let rowData = gvwList.getRowData(i+1);

			if (gfn_nvl(rowData.ACCOUNT_EMP_CODE) == "" && !rowData.grandtotal) {
				gvwList.setRowStyle(i+1, 'data', 'background', '#FFC0CB');
			}
		}
	}

	const fn_gvwListDblclick = async function() {
		var nRow = gvwList.getRow();
		var nCol = gvwList.getCol();

		if(nCol == 53) {
			fn_findEmpCodeForGvwList(nRow, nCol);
		}

		if(nCol == 54) {
			fn_findEmpCodeForGvwList(nRow, (nCol - 1));
		}
	}

	const fn_gvwItemDblclick = async function() {
		var nRow = gvwItem.getRow();
		var nCol = gvwItem.getCol();

		if(nCol == 11) {
			fn_findDeptCodeForGvwItem(nRow, nCol);
		}

		if(nCol == 13) {
			fn_findProjectCodeForGvwList(nRow, nCol);
		}

		if(nCol == 15) {
			fn_findAccountCodeForGvwList(nRow, nCol);
		}
	}

	var fn_findEmpCodeForGvwList = function(row, col) {
		SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
		SBUxMethod.openModal('modal-compopup1');

		var searchText 		= '';
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_HRI001'
			,popupType				: 'A'
			,whereClause			: ''
			,searchCaptions			: ["부서",		"사원", 		"재직상태"]
			,searchInputFields		: ["DEPT_NAME",	"EMP_NAME", 	"EMP_STATE"]
			,searchInputValues		: ["", 			searchText,		""]
			,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
			,searchInputTypeValues	: ["", 			"",				jsonEmpState]				//select 경우
			,height					: '400px'
			,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
			,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				gvwList.setCellData(row, col, data.EMP_CODE);
				gvwList.setCellData(row, (col+1), data.EMP_NAME);
			},
		});
	}

	var fn_findDeptCodeForGvwItem = function(row, col) {
		SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
		SBUxMethod.openModal('modal-compopup1');

		var searchText 		= '';
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_ORG001'
			,popupType				: 'B'
			,whereClause			: ''
			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
			,searchInputValues		: ["", 				searchText,		gfn_dateToYmd(new Date())]

			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

			,height					: '400px'
			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
			,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				gvwItem.setCellData(row, (col-1), data.DEPT_CODE);
				gvwItem.setCellData(row, col, data.DEPT_NAME);
			},
		});
	}

	var fn_findProjectCodeForGvwList = function(row, col) {
		SBUxMethod.attr('modal-compopup1', 'header-title', '프로젝트');
		SBUxMethod.openModal('modal-compopup1');

		var strWhereClause 	= "AND FI_ORG_CODE = '" + gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE")) + "'" ;

		var searchText 		= '';
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_COM028'
			,popupType				: 'A'
			,whereClause			: strWhereClause
			,searchCaptions			: ["프로젝트코드",		"프로젝트명"]
			,searchInputFields		: ["PROJECT_CODE",	"PROJECT_NAME"]
			,searchInputValues		: ["", 			searchText]
			,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
			,searchInputTypeValues	: ["", 			""]				//select 경우
			,height					: '400px'
			,tableHeader			: ["프로젝트코드", "프로젝트명"]
			,tableColumnNames		: ["PROJECT_CODE", "PROJECT_NAME"]
			,tableColumnWidths		: ["150px", "250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				gvwList.setCellData(row, (col-1), data.PROJECT_CODE);
				gvwList.setCellData(row, col, data.PROJECT_NAME);
			},
		});
	}

	var fn_findAccountCodeForGvwList = function(row, col) {
		SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보');
		SBUxMethod.openModal('modal-compopup1');

		var searchText 		= '';
		var addParams = ['NULL'];
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_FIM045'
			,popupType				: 'B'
			,whereClause			: addParams
			,searchCaptions			: ["코드", 		"코드명"]
			,searchInputFields		: ["V_P_ACCOUNT_CODE", 	"V_P_ACCOUNT_NAME"]
			,searchInputValues		: ["", 				searchText]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
			,height					: '400px'
			,tableHeader			: ["계정코드",		"계정명", 		"계정명(한글)"]
			,tableColumnNames		: ["ACCOUNT_CODE",	"ACCOUNT_NAME", 	"ACCOUNT_NAME_CHN"]
			,tableColumnWidths		: ["100px", 		"100px", 		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				gvwItem.setCellData(row, (col-1), data.ACCOUNT_CODE);
				gvwItem.setCellData(row, col, data.ACCOUNT_NAME);
			},
		});
	}

	const fn_view = async function () {
		var nRow = gvwList.getRow();
		var nCol = gvwList.getCol();
		var rowData = gvwList.getRowData(nRow);

		if(nCol == 53 || nCol == 54) return;

		if(gfn_nvl(rowData) == "") return;

		let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));
		let DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_DATE_FR"));
		let DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_DATE_TO"));
		let CS_BIZ_REGNO = gfnma_nvl(SBUxMethod.get("SRCH_CS_BIZ_REGNO"));
		let APPROVAL_NO = gfnma_nvl(rowData.APPROVAL_NO);
		let ITEM_TAXABLE_AMT = gfnma_nvl(SBUxMethod.get("SRCH_AMT"));
		let CS_NAME = gfnma_nvl(SBUxMethod.get("SRCH_CS_NAME"));
		let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
		let GUBUN = gfnma_nvl(SBUxMethod.get("SRCH_RIDGUBUN"));

		var paramObj = {
			V_P_DEBUG_MODE_YN	: '',
			V_P_LANG_ID		: '',
			V_P_COMP_CODE		: gv_ma_selectedApcCd,
			V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
			V_P_FI_ORG_CODE : FI_ORG_CODE,
			V_P_DATE_FR : DATE_FR,
			V_P_DATE_TO : DATE_TO,
			V_P_CS_BIZ_REGNO : CS_BIZ_REGNO,
			V_P_APPROVAL_NO : APPROVAL_NO,
			V_P_ITEM_TAXABLE_AMT : ITEM_TAXABLE_AMT,
			V_P_CS_NAME : CS_NAME,
			V_P_EMP_CODE : EMP_CODE,
			V_P_GUBUN : GUBUN,
			V_P_FORM_ID		: p_formId,
			V_P_MENU_ID		: p_menuId,
			V_P_PROC_ID		: '',
			V_P_USERID			: '',
			V_P_PC				: ''
		};

		const postJsonPromiseForList = gfn_postJSON("/fi/far/rec/selectFig3300List.do", {
			getType				: 'json',
			workType			: 'ITEM',
			cv_count			: '3',
			params				: gfnma_objectToString(paramObj)
		});

		const listData = await postJsonPromiseForList;
		console.log('data:', listData);

		try {
			if (_.isEqual("S", listData.resultStatus)) {
				jsonItemList.length = 0;
				listData.cv_3.forEach((item, index) => {
					const msg = {
						ROW_STATUS : item.ROW_STATUS,
						APPROVAL_NO : item.APPROVAL_NO,
						SEQ : item.SEQ,
						ITEM_NAME : item.ITEM_NAME,
						ITEM_SPEC : item.ITEM_SPEC,
						ITEM_QTY : item.ITEM_QTY,
						ITEM_UNIT_PRICE : item.ITEM_UNIT_PRICE,
						ITEM_TAXABLE_AMT : item.ITEM_TAXABLE_AMT,
						ITEM_VAT_AMT : item.ITEM_VAT_AMT,
						ITEM_DESC : item.ITEM_DESC,
						COST_CENTER_CODE : item.COST_CENTER_CODE,
						DEPT_CODE : item.DEPT_CODE,
						DEPT_NAME : item.DEPT_NAME,
						PROJECT_CODE : item.PROJECT_CODE,
						PROJECT_NAME : item.PROJECT_NAME,
						ACCOUNT_CODE : item.ACCOUNT_CODE,
						ACCOUNT_NAME : item.ACCOUNT_NAME,
					}
					jsonItemList.push(msg);
				});
				gvwItem.rebuild();
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

	const fn_findEmpCode = function() {
		var searchCode 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
		var searchName 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
		var replaceText0 	= "_DEPT_NAME_";
		var replaceText1 	= "_EMP_CODE_";
		var replaceText2 	= "_EMP_NAME_";
		var replaceText3 	= "_EMP_STATE_";
		var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

		SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_HRI001'
			,popupType				: 'A'
			,whereClause			: strWhereClause
			,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
			,searchInputValues		: ["", 			searchCode, searchName,		""]
			,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
			,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
			,height					: '400px'
			,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
			,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('EMP_NAME', data.EMP_NAME);
				SBUxMethod.set('EMP_CODE', data.EMP_CODE);
			},
		});
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createGvwListGrid();
		fn_createGvwItemGrid();
		fn_search();

		document.getElementById('xmlFile').addEventListener('change', function(event) {
			if(!window.FileReader) return;

			var files = event.target.files;
			var promises = Array.from(files).map(file => {
				return new Promise((resolve, reject) => {
					var reader = new FileReader();

					reader.addEventListener("load", () => {
						fn_uploadXml(reader.result);
						resolve();
					}, false);

					reader.addEventListener("error", reject, false);

					reader.readAsText(file);
				});
			});

			Promise.all(promises).then(() => {
				fn_insertXmlData();
			}).catch(error => {
				console.error("Error processing files:", error);
			});
		});

		document.getElementById('excelFile').addEventListener('change', function(event) {
			if(!window.FileReader) return;

			if (event.target.files[0].name.substring(0, 9) != "매입전자세금계산서") {
				gfn_comAlert("E0000", "매입전자세금계산서만 가능합니다. 파일명은 '매입전자세금계산서..' 로 시작해야합니다. 파일명을 확인해주세요")
				return;
			}

			var reader = new FileReader();
			let strmindate = gfnma_nvl(SBUxMethod.get("SRCH_DATE_FR"));
			let strmaxdate = gfnma_nvl(SBUxMethod.get("SRCH_DATE_TO"));
			let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));

			reader.addEventListener(
					"load",
					() => {
						let workBook = XLSX.read(reader.result, { type: 'binary' });
						workBook.SheetNames.forEach(function (sheetName) {
							if(sheetName == "세금계산서") {
								let list = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 6, header: [
										"WRITE_DATE",
										"APPROVAL_NO",
										"ISSUE_DATE",
										"SEND_DATE",
										"SELLER_REG_NO",
										"SELLER_SUB_REG_NO",
										"SELLER_NAME",
										"SELLER_OWNER",
										"SELLER_ADDRESS",
										"BUYER_REG_NO",
										"BUYER_SUB_REG_NO",
										"BUYER_NAME",
										"BUYER_OWNER",
										"BUYER_ADDRESS",
										"TOTAL_AMT",
										"TOTAL_VAT_AMT",
										"TOTAL_TAXABLE_AMT",
										"EINVOICE_CATEGORY",
										"EINVOICE_TYPE",
										"ISSUE_TYPE",
										"DESCRIPTION",
										"RECEIPT_OR_BILL",
										"SELLER_EMAIL",
										"BUYER_EMAIL1",
										"BUYER_EMAIL2",
										"TXN_DATE",
										"ITEM_NAME",
										"ITEM_SPEC",
										"ITEM_QTY",
										"ITEM_UNIT_PRICE",
										"ITEM_VAT_AMT",
										"ITEM_TAXABLE_AMT",
										"ITEM_DESC"
									]});


								list.forEach((item, index) => {
									if(gfn_nvl(item.APPROVAL_NO) != "") {
										if (parseInt(item.ISSUE_DATE.replaceAll("-", "")) < parseInt(strmindate)) {
											strmindate = item.ISSUE_DATE.replaceAll("-", "");
										}

										if (parseInt(item.ISSUE_DATE.replaceAll("-", "")) > parseInt(strmaxdate)) {
											strmaxdate = item.ISSUE_DATE.replaceAll("-", "");
										}

										item["WRITE_DATE"] = item.WRITE_DATE.replaceAll("-", "");
										item["ISSUE_DATE"] = item.ISSUE_DATE.replaceAll("-", "");
										item["SEND_DATE"] = item.SEND_DATE.replaceAll("-", "");
										item["TXN_DATE"] = item.TXN_DATE.replaceAll("-", "");
										item["SELLER_ADDRESS"] = item.SELLER_ADDRESS
										item["BUYER_ADDRESS"] = item.BUYER_ADDRESS

										item["OTHER_DESC"] = "";
										item["ACCOUNT_EMP_CODE"] = "";
										item["FI_ORG_CODE"] = FI_ORG_CODE;
										item["MATCH_METHOD"] = "";
										item["SELLER_BIZ_CATEGORY"] = "";
										item["SELLER_BIZ_ITEM"] = "";
										item["BUYER_BIZ_CATEGORY"] = "";
										item["BUYER_BIZ_ITEM"] = "";
										item["BUYER_BIZ_TYPE"] = "";
										item["DOC_ID"] = "";

										gvwList.addRow(true, item);
									}
								});
							}

							if(sheetName == "품목") {
								let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 5, header: [
										"APPROVAL_NO",
										"SEQ",
										"SELLER_REG_NO",
										"BUYER_REG_NO",
										"WRITE_DATE",
										"ITEM_NAME",
										"ITEM_SPEC",
										"ITEM_QTY",
										"ITEM_UNIT_PRICE",
										"ITEM_TAXABLE_AMT",
										"ITEM_VAT_AMT",
										"ITEM_DESC"
									]});

								rows.forEach((item, index) => {
									item["COST_CENTER_CODE"] = "";
									item["ACCOUNT_CODE"] = "";
									item["DEPT_CODE"] = "";
									item["PROJECT_CODE"] = "";

									gvwItem.addRow(true, item);
								});
							}
						})
						fn_excelUpload();
					},
					false,
			);
			reader.readAsBinaryString(event.target.files[0]);
		});

		document.getElementById('excelFile2').addEventListener('change', function(event) {
			if(!window.FileReader) return;

			if (event.target.files[0].name.substring(0, 7) != "매입전자계산서") {
				gfn_comAlert("E0000", "매입전자계산서만 가능합니다. 파일명은 '매입전자계산서..' 로 시작해야합니다. 파일명을 확인해주세요")
				return;
			}

			var reader = new FileReader();
			let strmindate = gfnma_nvl(SBUxMethod.get("SRCH_DATE_FR"));
			let strmaxdate = gfnma_nvl(SBUxMethod.get("SRCH_DATE_TO"));
			let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));

			reader.addEventListener(
					"load",
					() => {
						let workBook = XLSX.read(reader.result, { type: 'binary' });
						workBook.SheetNames.forEach(function (sheetName) {
							if(sheetName == "세금계산서") {
								let list = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 6, header: [
										"WRITE_DATE",
										"APPROVAL_NO",
										"ISSUE_DATE",
										"SEND_DATE",
										"SELLER_REG_NO",
										"SELLER_SUB_REG_NO",
										"SELLER_NAME",
										"SELLER_OWNER",
										"SELLER_ADDRESS",
										"BUYER_REG_NO",
										"BUYER_SUB_REG_NO",
										"BUYER_NAME",
										"BUYER_OWNER",
										"BUYER_ADDRESS",
										"TOTAL_AMT",
										"TOTAL_VAT_AMT",
										"EINVOICE_CATEGORY",
										"EINVOICE_TYPE",
										"ISSUE_TYPE",
										"DESCRIPTION",
										"RECEIPT_OR_BILL",
										"SELLER_EMAIL",
										"BUYER_EMAIL1",
										"BUYER_EMAIL2",
										"TXN_DATE",
										"ITEM_NAME",
										"ITEM_SPEC",
										"ITEM_QTY",
										"ITEM_UNIT_PRICE",
										"ITEM_TAXABLE_AMT",
										"ITEM_VAT_AMT",
										"ITEM_DESC"
									]});

								list.forEach((item, index) => {
									if(gfn_nvl(item.APPROVAL_NO) != "") {
										if (parseInt(item.ISSUE_DATE.replaceAll("-", "")) < parseInt(strmindate)) {
											strmindate = item.ISSUE_DATE.replaceAll("-", "");
										}

										if (parseInt(item.ISSUE_DATE.replaceAll("-", "")) > parseInt(strmaxdate)) {
											strmaxdate = item.ISSUE_DATE.replaceAll("-", "");
										}

										item["WRITE_DATE"] = item.WRITE_DATE.replaceAll("-", "");
										item["ISSUE_DATE"] = item.ISSUE_DATE.replaceAll("-", "");
										item["SEND_DATE"] = item.SEND_DATE.replaceAll("-", "");
										item["TXN_DATE"] = item.TXN_DATE.replaceAll("-", "");
										item["SELLER_ADDRESS"] = item.SELLER_ADDRESS
										item["BUYER_ADDRESS"] = item.BUYER_ADDRESS

										item["TOTAL_TAXABLE_AMT"] = '0';
										item["OTHER_DESC"] = "";
										item["ACCOUNT_EMP_CODE"] = "";
										item["FI_ORG_CODE"] = FI_ORG_CODE;
										item["MATCH_METHOD"] = "";
										item["SELLER_BIZ_CATEGORY"] = "";
										item["SELLER_BIZ_ITEM"] = "";
										item["BUYER_BIZ_CATEGORY"] = "";
										item["BUYER_BIZ_ITEM"] = "";
										item["BUYER_BIZ_TYPE"] = "";
										item["DOC_ID"] = "";

										gvwList.addRow(true, item);
									}
								});
							}

							if(sheetName == "품목") {
								let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 5, header: [
										"APPROVAL_NO",
										"SEQ",
										"SELLER_REG_NO",
										"BUYER_REG_NO",
										"WRITE_DATE",
										"ITEM_NAME",
										"ITEM_SPEC",
										"ITEM_QTY",
										"ITEM_UNIT_PRICE",
										"ITEM_TAXABLE_AMT",
										"ITEM_VAT_AMT",
										"ITEM_DESC"
									]});

								rows.forEach((item, index) => {
									item["ITEM_QTY"] = gfn_nvl(item.ITEM_QTY) == "" ? '0' : item.ITEM_QTY;
									item["ITEM_UNIT_PRICE"] = gfn_nvl(item.ITEM_UNIT_PRICE) == "" ? '0' : item.ITEM_UNIT_PRICE;
									item["ITEM_TAXABLE_AMT"] = gfn_nvl(item.ITEM_TAXABLE_AMT) == "" ? '0' : item.ITEM_TAXABLE_AMT;

									item["ITEM_VAT_AMT"] = '0';
									item["COST_CENTER_CODE"] = "";
									item["ACCOUNT_CODE"] = "";
									item["DEPT_CODE"] = "";
									item["PROJECT_CODE"] = "";

									gvwItem.addRow(true, item);
								});
							}
						})
						fn_excelUpload()
					},
					false,
			);
			reader.readAsBinaryString(event.target.files[0]);
		});
	});

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

	const fn_save = async function () {
		let updatedData = gvwList.getUpdateData(true, 'all');
		let returnData = [];

		updatedData.forEach((item, index) => {
			const param = {
				cv_count : '0',
				getType : 'json',
				rownum: item.rownum,
				workType : 'U',
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN : '',
					V_P_LANG_ID	: '',
					V_P_COMP_CODE : gv_ma_selectedApcCd,
					V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
					V_P_FI_ORG_CODE : item.data.FI_ORG_CODE,
					V_P_WRITE_DATE : item.data.WRITE_DATE,
					V_P_APPROVAL_NO : item.data.APPROVAL_NO,
					V_P_ISSUE_DATE : item.data.ISSUE_DATE,
					V_P_SEND_DATE : item.data.SEND_DATE,
					V_P_SELLER_REG_NO : item.data.SELLER_REG_NO.replaceAll("-", ""),
					V_P_SELLER_SUB_REG_NO : item.data.SELLER_SUB_REG_NO,
					V_P_CS_CODE : item.data.CS_CODE,
					V_P_SELLER_NAME : item.data.SELLER_NAME,
					V_P_SELLER_OWNER : item.data.SELLER_OWNER,
					V_P_SELLER_ADDRESS : item.data.SELLER_ADDRESS,
					V_P_SELLER_BIZ_CATEGORY : item.data.SELLER_BIZ_CATEGORY,
					V_P_SELLER_BIZ_ITEM : item.data.SELLER_BIZ_ITEM,
					V_P_BUYER_REG_NO : item.data.BUYER_REG_NO.replaceAll("-", ""),
					V_P_BUYER_SUB_REG_NO : item.data.BUYER_SUB_REG_NO,
					V_P_BUYER_NAME : item.data.BUYER_NAME,
					V_P_BUYER_OWNER : item.data.BUYER_OWNER,
					V_P_BUYER_ADDRESS : item.data.BUYER_ADDRESS,
					V_P_BUYER_BIZ_CATEGORY : item.data.BUYER_BIZ_CATEGORY,
					V_P_BUYER_BIZ_ITEM : item.data.BUYER_BIZ_ITEM,
					V_P_BUYER_BIZ_TYPE : item.data.BUYER_BIZ_TYPE,
					V_P_TOTAL_AMT : parseInt(gfn_nvl(item.data.TOTAL_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_AMT)),
					V_P_TOTAL_TAXABLE_AMT : parseInt(gfn_nvl(item.data.TOTAL_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_TAXABLE_AMT)),
					V_P_TOTAL_VAT_AMT : parseInt(gfn_nvl(item.data.TOTAL_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_VAT_AMT)),
					V_P_EINVOICE_CATEGORY : item.data.EINVOICE_CATEGORY,
					V_P_EINVOICE_TYPE : item.data.EINVOICE_TYPE,
					V_P_MATCH_METHOD : item.data.MATCH_METHOD,
					V_P_ISSUE_TYPE : item.data.ISSUE_TYPE,
					V_P_NOTE1 : item.data.NOTE1,
					V_P_NOTE2 : item.data.NOTE2,
					V_P_RECEIPT_OR_BILL : item.data.RECEIPT_OR_BILL,
					V_P_SELLER_EMAIL : item.data.SELLER_EMAIL,
					IV_P_BUYER_EMAIL1 : item.data._BUYER_EMAIL1,
					V_P_BUYER_EMAIL2 : item.data.BUYER_EMAIL2,
					V_P_ACCOUNT_EMP_CODE : item.data.ACCOUNT_EMP_CODE,
					V_P_TXN_DATE : item.data.TXN_DATE.replaceAll("-", ""),
					V_P_DOC_ID : item.data.DOC_ID,
					V_P_FORM_ID : p_formId,
					V_P_MENU_ID : p_menuId,
					V_P_PROC_ID : '',
					V_P_USERID : '',
					V_P_PC : ''
				})
			}
			returnData.push(param);
		});

		if(returnData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300List.do", {listData: returnData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					let updatedData = gvwItem.getUpdateData(true, 'all');
					let returnData = [];

					updatedData.forEach((item, index) => {
						const param = {
							cv_count : '0',
							getType : 'json',
							rownum: item.rownum,
							workType : 'U1',
							params: gfnma_objectToString({
								V_P_DEBUG_MODE_YN : '',
								V_P_LANG_ID	: '',
								V_P_COMP_CODE : gv_ma_selectedApcCd,
								V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
								V_P_APPROVAL_NO : item.data.APPROVAL_NO,
								V_P_SEQ : item.data.SEQ,
								V_P_ITEM_NAME : item.data.ITEM_NAME,
								V_P_ITEM_SPEC : item.data.ITEM_SPEC,
								V_P_ITEM_QTY : parseInt(gfn_nvl(item.data.ITEM_QTY) == "" ? "0" : gfn_nvl(item.data.ITEM_QTY)),
								V_P_ITEM_UNIT_PRICE : parseInt(gfn_nvl(item.data.ITEM_UNIT_PRICE) == "" ? "0" : gfn_nvl(item.data.ITEM_UNIT_PRICE)),
								V_P_ITEM_TAXABLE_AMT : parseInt(gfn_nvl(item.data.ITEM_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_TAXABLE_AMT)),
								V_P_ITEM_VAT_AMT : parseInt(gfn_nvl(item.data.ITEM_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_VAT_AMT)),
								V_P_ITEM_DESC : item.data.ITEM_DESC,
								V_P_COST_CENTER_CODE : item.data.COST_CENTER_CODE,
								V_P_DEPT_CODE : item.data.DEPT_CODE,
								V_P_PROJECT_CODE : item.data.PROJECT_CODE,
								V_P_ACCOUNT_CODE : item.data.ACCOUNT_CODE,
								V_P_FORM_ID : p_formId,
								V_P_MENU_ID : p_menuId,
								V_P_PROC_ID : '',
								V_P_USERID : '',
								V_P_PC : ''
							})
						}
						returnData.push(param);
					});

					if(returnData.length > 0) {
						const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300ItemList.do", {listData: returnData});
						const data = await postJsonPromise;

						try {
							if (_.isEqual("S", data.resultStatus)) {
								gfn_comAlert("I0001");
								fn_search();
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

	const fn_delete = async function () {
		let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHK_YN"), true);
		let returnData = [];

		if(gvwListCheckedList.length == 0) {
			return;
		}

		gvwListCheckedList.forEach((item, index) => {
			let data = gvwList.getRowData(item);

			const param = {
				cv_count : '0',
				getType : 'json',
				rownum: item,
				workType : 'D',
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN : '',
					V_P_LANG_ID	: '',
					V_P_COMP_CODE : gv_ma_selectedApcCd,
					V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
					V_P_FI_ORG_CODE : data.FI_ORG_CODE,
					V_P_WRITE_DATE : data.WRITE_DATE,
					V_P_APPROVAL_NO : data.APPROVAL_NO,
					V_P_ISSUE_DATE : data.ISSUE_DATE,
					V_P_SEND_DATE : data.SEND_DATE,
					V_P_SELLER_REG_NO : data.SELLER_REG_NO.replaceAll("-", ""),
					V_P_SELLER_SUB_REG_NO : data.SELLER_SUB_REG_NO,
					V_P_CS_CODE : data.CS_CODE,
					V_P_SELLER_NAME : data.SELLER_NAME,
					V_P_SELLER_OWNER : data.SELLER_OWNER,
					V_P_SELLER_ADDRESS : data.SELLER_ADDRESS,
					V_P_SELLER_BIZ_CATEGORY : data.SELLER_BIZ_CATEGORY,
					V_P_SELLER_BIZ_ITEM : data.SELLER_BIZ_ITEM,
					V_P_BUYER_REG_NO : data.BUYER_REG_NO.replaceAll("-", ""),
					V_P_BUYER_SUB_REG_NO : data.BUYER_SUB_REG_NO,
					V_P_BUYER_NAME : data.BUYER_NAME,
					V_P_BUYER_OWNER : data.BUYER_OWNER,
					V_P_BUYER_ADDRESS : data.BUYER_ADDRESS,
					V_P_BUYER_BIZ_CATEGORY : data.BUYER_BIZ_CATEGORY,
					V_P_BUYER_BIZ_ITEM : data.BUYER_BIZ_ITEM,
					V_P_BUYER_BIZ_TYPE : data.BUYER_BIZ_TYPE,
					V_P_TOTAL_AMT : parseInt(gfn_nvl(data.TOTAL_AMT) == "" ? "0" : gfn_nvl(data.TOTAL_AMT)),
					V_P_TOTAL_TAXABLE_AMT : parseInt(gfn_nvl(data.TOTAL_TAXABLE_AMT) == "" ? "0" : gfn_nvl(data.TOTAL_TAXABLE_AMT)),
					V_P_TOTAL_VAT_AMT : parseInt(gfn_nvl(data.TOTAL_VAT_AMT) == "" ? "0" : gfn_nvl(data.TOTAL_VAT_AMT)),
					V_P_EINVOICE_CATEGORY : data.EINVOICE_CATEGORY,
					V_P_EINVOICE_TYPE : data.EINVOICE_TYPE,
					V_P_MATCH_METHOD : data.MATCH_METHOD,
					V_P_ISSUE_TYPE : data.ISSUE_TYPE,
					V_P_NOTE1 : data.NOTE1,
					V_P_NOTE2 : data.NOTE2,
					V_P_RECEIPT_OR_BILL : data.RECEIPT_OR_BILL,
					V_P_SELLER_EMAIL : data.SELLER_EMAIL,
					IV_P_BUYER_EMAIL1 : data._BUYER_EMAIL1,
					V_P_BUYER_EMAIL2 : data.BUYER_EMAIL2,
					V_P_ACCOUNT_EMP_CODE : data.ACCOUNT_EMP_CODE,
					V_P_TXN_DATE : data.TXN_DATE.replaceAll("-", ""),
					V_P_DOC_ID : data.DOC_ID,
					V_P_FORM_ID : p_formId,
					V_P_MENU_ID : p_menuId,
					V_P_PROC_ID : '',
					V_P_USERID : '',
					V_P_PC : ''
				})
			}
			returnData.push(param);
		});

		if(returnData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300List.do", {listData: returnData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001");
					fn_search();
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

	const fn_search = async function () {
		let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));
		let DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_DATE_FR"));
		let DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_DATE_TO"));
		let CS_BIZ_REGNO = gfnma_nvl(SBUxMethod.get("SRCH_CS_BIZ_REGNO"));
		let APPROVAL_NO = gfnma_nvl(SBUxMethod.get("SRCH_APPROVAL_NO"));
		let ITEM_TAXABLE_AMT = gfnma_nvl(SBUxMethod.get("SRCH_AMT"));
		let CS_NAME = gfnma_nvl(SBUxMethod.get("SRCH_CS_NAME"));
		let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
		let GUBUN = gfnma_nvl(SBUxMethod.get("SRCH_RIDGUBUN"));

		var paramObj = {
			V_P_DEBUG_MODE_YN	: '',
			V_P_LANG_ID		: '',
			V_P_COMP_CODE		: gv_ma_selectedApcCd,
			V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
			V_P_FI_ORG_CODE : FI_ORG_CODE,
			V_P_DATE_FR : DATE_FR,
			V_P_DATE_TO : DATE_TO,
			V_P_CS_BIZ_REGNO : CS_BIZ_REGNO,
			V_P_APPROVAL_NO : APPROVAL_NO,
			V_P_ITEM_TAXABLE_AMT : ITEM_TAXABLE_AMT,
			V_P_CS_NAME : CS_NAME,
			V_P_EMP_CODE : EMP_CODE,
			V_P_GUBUN : GUBUN,
			V_P_FORM_ID		: p_formId,
			V_P_MENU_ID		: p_menuId,
			V_P_PROC_ID		: '',
			V_P_USERID			: '',
			V_P_PC				: ''
		};

		const postJsonPromiseForList = gfn_postJSON("/fi/far/rec/selectFig3300List.do", {
			getType				: 'json',
			workType			: 'Q',
			cv_count			: '3',
			params				: gfnma_objectToString(paramObj)
		});

		const listData = await postJsonPromiseForList;
		console.log('data:', listData);

		try {
			if (_.isEqual("S", listData.resultStatus)) {
				jsonSearchResultList.length = 0;

				listData.cv_1.forEach((item, index) => {
					const msg = {
						ROW_STATUS : item.ROW_STATUS,
						CHECK_YN : item.CHECK_YN,
						WRITE_DATE : item.WRITE_DATE,
						APPROVAL_NO : item.APPROVAL_NO,
						ISSUE_DATE : item.ISSUE_DATE,
						SEND_DATE : item.SEND_DATE,
						SELLER_REG_NO : item.SELLER_REG_NO,
						SELLER_SUB_REG_NO : item.SELLER_SUB_REG_NO,
						CS_CODE : item.CS_CODE,
						CS_CODE_ORG : item.CS_CODE_ORG,
						SELLER_NAME : item.SELLER_NAME,
						SELLER_OWNER : item.SELLER_OWNER,
						SELLER_BIZ_CATEGORY : item.SELLER_BIZ_CATEGORY,
						SELLER_BIZ_ITEM : item.SELLER_BIZ_ITEM,
						SELLER_BIZ_TYPE : item.SELLER_BIZ_TYPE,
						BUYER_REG_NO : item.BUYER_REG_NO,
						BUYER_SUB_REG_NO : item.BUYER_SUB_REG_NO,
						BUYER_NAME : item.BUYER_NAME,
						BUYER_OWNER : item.BUYER_OWNER,
						BUYER_BIZ_CATEGORY : item.BUYER_BIZ_CATEGORY,
						BUYER_BIZ_ITEM : item.BUYER_BIZ_ITEM,
						BUYER_BIZ_TYPE : item.BUYER_BIZ_TYPE,
						TOTAL_AMT : item.TOTAL_AMT,
						TOTAL_TAXABLE_AMT : item.TOTAL_TAXABLE_AMT,
						TOTAL_VAT_AMT : item.TOTAL_VAT_AMT,
						DOC_TOTAL_AMT : item.DOC_TOTAL_AMT,
						DOC_SUPPLY_AMT : item.DOC_SUPPLY_AMT,
						DOC_VAT_AMT : item.DOC_VAT_AMT,
						DIFF_FLAG : item.DIFF_FLAG,
						EINVOICE_CATEGORY : item.EINVOICE_CATEGORY,
						EINVOICE_TYPE : item.EINVOICE_TYPE,
						MATCH_METHOD : item.MATCH_METHOD,
						ISSUE_TYPE : item.ISSUE_TYPE,
						NOTE1 : item.NOTE1,
						NOTE2 : item.NOTE2,
						NOTE3 : item.NOTE3,
						RECEIPT_OR_BILL : item.RECEIPT_OR_BILL,
						SELLER_EMAIL : item.SELLER_EMAIL,
						BUYER_EMAIL1 : item.BUYER_EMAIL1,
						BUYER_EMAIL2 : item.BUYER_EMAIL2,
						ACCOUNT_EMP_CODE : item.ACCOUNT_EMP_CODE,
						ACCOUNT_EMP_NAME : item.ACCOUNT_EMP_NAME,
						TXN_DATE : item.TXN_DATE,
						INTERFACED_FLAG : item.INTERFACED_FLAG,
						FI_ORG_CODE : item.FI_ORG_CODE,
						SELLER_ADDRESS : item.SELLER_ADDRESS,
						BUYER_ADDRESS : item.BUYER_ADDRESS,
						DOC_ID : item.DOC_ID,
						DOC_NAME : item.DOC_NAME,
						DOC_BATCH_NO : item.DOC_BATCH_NO,
						RID_GUBUN : item.RID_GUBUN,
						EXCEPT_CODE : item.EXCEPT_CODE,
						EXCEPT_REASON : item.EXCEPT_REASON,
						ITEM_NAME : item.ITEM_NAME,
						ITEM_SPEC : item.ITEM_SPEC,
						ITEM_QTY : item.ITEM_QTY,
						ITEM_UNIT_PRICE : item.ITEM_UNIT_PRICE,
						ITEM_TAXABLE_AMT : item.ITEM_TAXABLE_AMT,
						ITEM_VAT_AMT : item.ITEM_VAT_AMT,
						ITEM_DESC : item.ITEM_DESC

					}
					jsonSearchResultList.push(msg);
				});
				gvwList.rebuild();

				if(jsonSearchResultList.length > 0) {
					gvwList.clickRow(1);
				} else {
					jsonItemList.length = 0;
					gvwItem.rebuild();
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

	const fn_uploadXml = async function (file) {
		let parser = new DOMParser();
		let xml = parser.parseFromString(file, "text/xml");
		let parseXmlForJson = xmlToJson(xml);
		let taxInvoice = parseXmlForJson.TaxInvoice;

		let nodeTaxInvoice = taxInvoice;
		let nodeExchangedDocument = taxInvoice.ExchangedDocument;
		let nodeTaxInvoiceDocument = taxInvoice.TaxInvoiceDocument;
		let nodeInvoicerParty = taxInvoice.TaxInvoiceTradeSettlement.InvoicerParty;
		let nodeInvoiceeParty = taxInvoice.TaxInvoiceTradeSettlement.InvoiceeParty;
		let nodeSpecifiedMonetarySummation = taxInvoice.TaxInvoiceTradeSettlement.SpecifiedMonetarySummation;
		let nodeTaxInvoiceTradeLineItem = taxInvoice.TaxInvoiceTradeLineItem;
		let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));

		if (nodeTaxInvoice != null) {
			var rowHeader = {};

			rowHeader["CHECK_YN"] = "N";
			rowHeader["INTERFACED_FLAG"] = "N";
			rowHeader["CS_CODE"] = "";
			rowHeader["CS_CODE_ORG"] = "";
			rowHeader["ACCOUNT_EMP_CODE"] = "";
			rowHeader["DOC_ID"] = null;
			rowHeader["FI_ORG_CODE"] = FI_ORG_CODE;
			rowHeader["NOTE2"] = "";
			rowHeader["MATCH_METHOD"] = "";
			rowHeader["ISSUE_TYPE"] = "";
			rowHeader["SELLER_SUB_REG_NO"] = "";
			rowHeader["BUYER_SUB_REG_NO"] = "";

			//발행일자
			rowHeader["SEND_DATE"] = nodeExchangedDocument["IssueDateTime"].substring(0, 8);

			//세금계산서정보
			let strIssueId = nodeTaxInvoiceDocument["IssueID"];
			rowHeader["APPROVAL_NO"] = strIssueId;
			rowHeader["EINVOICE_CATEGORY"] = nodeTaxInvoiceDocument["TypeCode"];
			rowHeader["EINVOICE_TYPE"] = nodeTaxInvoiceDocument["TypeCode"].substring(2, 4);
			if (gfn_nvl(nodeTaxInvoiceDocument["DescriptionText"]) != "") {
				rowHeader["NOTE1"] = nodeTaxInvoiceDocument["DescriptionText"];
			}
			rowHeader["WRITE_DATE"] = nodeTaxInvoiceDocument["IssueDateTime"];
			rowHeader["ISSUE_DATE"] = nodeTaxInvoiceDocument["IssueDateTime"];
			rowHeader["TXN_DATE"] = nodeTaxInvoiceDocument["IssueDateTime"];
			rowHeader["RECEIPT_OR_BILL"] = nodeTaxInvoiceDocument["PurposeCode"];
			rowHeader["MATCH_METHOD"] = "1";
			rowHeader["ISSUE_TYPE"] = "1";

			//공급하는자
			rowHeader["SELLER_REG_NO"] = nodeInvoicerParty["ID"];
			rowHeader["SELLER_BIZ_CATEGORY"] = nodeInvoicerParty["TypeCode"];
			rowHeader["SELLER_NAME"] = nodeInvoicerParty["NameText"];
			rowHeader["SELLER_BIZ_ITEM"] = nodeInvoicerParty["ClassificationCode"];
			rowHeader["SELLER_OWNER"] = nodeInvoicerParty["SpecifiedPerson"].NameText;
			if (gfn_nvl(nodeInvoicerParty["DefinedContact"]) != "") {
				rowHeader["SELLER_EMAIL"] = nodeInvoicerParty["DefinedContact"].URICommunication;
			}
			rowHeader["SELLER_ADDRESS"] = nodeInvoicerParty["SpecifiedAddress"].LineOneText.replaceAll("\,", "&#44;");

			//공급받는자
			rowHeader["BUYER_REG_NO"] = nodeInvoiceeParty["ID"];
			rowHeader["BUYER_BIZ_CATEGORY"] = nodeInvoiceeParty["TypeCode"];
			rowHeader["BUYER_NAME"] = nodeInvoiceeParty["NameText"];
			rowHeader["BUYER_BIZ_ITEM"] = nodeInvoiceeParty["ClassificationCode"];
			rowHeader["BUYER_BIZ_TYPE"] = nodeInvoiceeParty["SpecifiedOrganization"].BusinessTypeCode;
			rowHeader["BUYER_OWNER"] = nodeInvoiceeParty["SpecifiedPerson"].NameText;
			rowHeader["BUYER_EMAIL1"] = nodeInvoiceeParty["PrimaryDefinedContact"].URICommunication;
			if (gfn_nvl(nodeInvoiceeParty["SecondaryDefinedContact"]) != "") {
				rowHeader["BUYER_EMAIL2"] = nodeInvoiceeParty["SecondaryDefinedContact"].URICommunication;
			}
			if (gfn_nvl(nodeInvoiceeParty["SPECIFIEDADDRESS"]) != "") {
				rowHeader["BUYER_ADDRESS"] = nodeInvoiceeParty["SpecifiedAddress"].LineOneText.replaceAll("\,", "&#44;");
			}

			rowHeader["TOTAL_TAXABLE_AMT"] = gfn_nvl(nodeSpecifiedMonetarySummation["ChargeTotalAmount"]) == "" ? '0' : nodeSpecifiedMonetarySummation["ChargeTotalAmount"];
			rowHeader["TOTAL_VAT_AMT"] = gfn_nvl(nodeSpecifiedMonetarySummation["TaxTotalAmount"]) == "" ? '0' : nodeSpecifiedMonetarySummation["TaxTotalAmount"];
			rowHeader["TOTAL_AMT"] = gfn_nvl(nodeSpecifiedMonetarySummation["GrandTotalAmount"]) == "" ? '0' : nodeSpecifiedMonetarySummation["GrandTotalAmount"];

			gvwList.addRow(true, rowHeader);

			if(Array.isArray(nodeTaxInvoiceTradeLineItem)) {
				nodeTaxInvoiceTradeLineItem.forEach((item, index) => {
					var rowItem = {};
					rowItem["APPROVAL_NO"] = strIssueId;
					rowItem["SEQ"] = item["SequenceNumeric"];
					rowItem["ITEM_TAXABLE_AMT"] = item["InvoiceAmount"];
					if (gfn_nvl(item["SecondaryDefinedContact"]) != "") {
						rowItem["ITEM_QTY"] = item["ChargeableUnitQuantity"];
					}
					rowItem["ITEM_NAME"] = item["NameText"];
					rowItem["TXN_DATE"] = item["PurchaseExpiryDateTime"];
					rowItem["ITEM_VAT_AMT"] = item["TotalTax"].CalculatedAmount;
					if (gfn_nvl(item["UnitPrice"]) != "") {
						rowItem["ITEM_UNIT_PRICE"] = item["UnitPrice"].UnitAmount;
					}
					gvwItem.addRow(true, rowItem);
				});
			} else {
				var rowItem = {};
				rowItem["APPROVAL_NO"] = strIssueId;
				rowItem["SEQ"] = nodeTaxInvoiceTradeLineItem["SequenceNumeric"];
				rowItem["ITEM_TAXABLE_AMT"] = nodeTaxInvoiceTradeLineItem["InvoiceAmount"];
				if (gfn_nvl(nodeTaxInvoiceTradeLineItem["SecondaryDefinedContact"]) != "") {
					rowItem["ITEM_QTY"] = nodeTaxInvoiceTradeLineItem["ChargeableUnitQuantity"];
				}
				rowItem["ITEM_NAME"] = nodeTaxInvoiceTradeLineItem["NameText"];
				rowItem["TXN_DATE"] = nodeTaxInvoiceTradeLineItem["PurchaseExpiryDateTime"];
				if (gfn_nvl(nodeTaxInvoiceTradeLineItem["TotalTax"]) != "") {
					rowItem["ITEM_VAT_AMT"] = nodeTaxInvoiceTradeLineItem["TotalTax"].CalculatedAmount;
				}
				if (gfn_nvl(nodeTaxInvoiceTradeLineItem["UnitPrice"]) != "") {
					rowItem["ITEM_UNIT_PRICE"] = nodeTaxInvoiceTradeLineItem["UnitPrice"].UnitAmount;
				}

				gvwItem.addRow(true, rowItem);
			}
		}
	}

	const fn_insertXmlData = async function () {
		let updatedData = gvwList.getUpdateData(true, 'i');
		let returnData = [];

		updatedData.forEach((item, index) => {
			const param = {
				cv_count : '0',
				getType : 'json',
				rownum: item.rownum,
				workType : 'N1',
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN : '',
					V_P_LANG_ID	: '',
					V_P_COMP_CODE : gv_ma_selectedApcCd,
					V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
					V_P_FI_ORG_CODE : gfn_nvl(item.data.FI_ORG_CODE),
					V_P_WRITE_DATE : gfn_nvl(item.data.WRITE_DATE),
					V_P_APPROVAL_NO : gfn_nvl(item.data.APPROVAL_NO),
					V_P_ISSUE_DATE : gfn_nvl(item.data.ISSUE_DATE),
					V_P_SEND_DATE : gfn_nvl(item.data.SEND_DATE),
					V_P_SELLER_REG_NO : gfn_nvl(item.data.SELLER_REG_NO.replaceAll("-", "")),
					V_P_SELLER_SUB_REG_NO : gfn_nvl(item.data.SELLER_SUB_REG_NO),
					V_P_CS_CODE : gfn_nvl(item.data.CS_CODE),
					V_P_SELLER_NAME : gfn_nvl(item.data.SELLER_NAME),
					V_P_SELLER_OWNER : gfn_nvl(item.data.SELLER_OWNER),
					V_P_SELLER_ADDRESS : gfn_nvl(item.data.SELLER_ADDRESS),
					V_P_SELLER_BIZ_CATEGORY : gfn_nvl(item.data.SELLER_BIZ_CATEGORY),
					V_P_SELLER_BIZ_ITEM : gfn_nvl(item.data.SELLER_BIZ_ITEM),
					V_P_BUYER_REG_NO : gfn_nvl(item.data.BUYER_REG_NO.replaceAll("-", "")),
					V_P_BUYER_SUB_REG_NO : gfn_nvl(item.data.BUYER_SUB_REG_NO),
					V_P_BUYER_NAME : gfn_nvl(item.data.BUYER_NAME),
					V_P_BUYER_OWNER : gfn_nvl(item.data.BUYER_OWNER),
					V_P_BUYER_ADDRESS : gfn_nvl(item.data.BUYER_ADDRESS),
					V_P_BUYER_BIZ_CATEGORY : gfn_nvl(item.data.BUYER_BIZ_CATEGORY),
					V_P_BUYER_BIZ_ITEM : gfn_nvl(item.data.BUYER_BIZ_ITEM),
					V_P_BUYER_BIZ_TYPE : gfn_nvl(item.data.BUYER_BIZ_TYPE),
					V_P_TOTAL_AMT : parseInt(gfn_nvl(item.data.TOTAL_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_AMT)),
					V_P_TOTAL_TAXABLE_AMT : parseInt(gfn_nvl(item.data.TOTAL_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_TAXABLE_AMT)),
					V_P_TOTAL_VAT_AMT : parseInt(gfn_nvl(item.data.TOTAL_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_VAT_AMT)),
					V_P_EINVOICE_CATEGORY : gfn_nvl(item.data.EINVOICE_CATEGORY),
					V_P_EINVOICE_TYPE : gfn_nvl(item.data.EINVOICE_TYPE),
					V_P_MATCH_METHOD : gfn_nvl(item.data.MATCH_METHOD),
					V_P_ISSUE_TYPE : gfn_nvl(item.data.ISSUE_TYPE),
					V_P_NOTE1 : gfn_nvl(item.data.NOTE1),
					V_P_NOTE2 : gfn_nvl(item.data.NOTE2),
					V_P_RECEIPT_OR_BILL : gfn_nvl(item.data.RECEIPT_OR_BILL),
					V_P_SELLER_EMAIL : gfn_nvl(item.data.SELLER_EMAIL),
					IV_P_BUYER_EMAIL1 : gfn_nvl(item.data.BUYER_EMAIL1),
					V_P_BUYER_EMAIL2 : gfn_nvl(item.data.BUYER_EMAIL2),
					V_P_ACCOUNT_EMP_CODE : gfn_nvl(item.data.ACCOUNT_EMP_CODE),
					V_P_TXN_DATE : gfn_nvl(item.data.TXN_DATE.replaceAll("-", "")),
					V_P_DOC_ID : gfn_nvl(item.data.DOC_ID),
					V_P_FORM_ID : p_formId,
					V_P_MENU_ID : p_menuId,
					V_P_PROC_ID : '',
					V_P_USERID : '',
					V_P_PC : ''
				})
			}
			returnData.push(param);
		});
		if(returnData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300List.do", {listData: returnData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					let updatedData = gvwItem.getUpdateData(true, 'i');
					let returnData = [];

					updatedData.forEach((item, index) => {
						const param = {
							cv_count : '0',
							getType : 'json',
							rownum: item.rownum,
							workType : 'N',
							params: gfnma_objectToString({
								V_P_DEBUG_MODE_YN : '',
								V_P_LANG_ID	: '',
								V_P_COMP_CODE : gv_ma_selectedApcCd,
								V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
								V_P_APPROVAL_NO : gfn_nvl(item.data.APPROVAL_NO),
								V_P_SEQ : gfn_nvl(item.data.SEQ),
								V_P_ITEM_NAME : gfn_nvl(item.data.ITEM_NAME),
								V_P_ITEM_SPEC : gfn_nvl(item.data.ITEM_SPEC),
								V_P_ITEM_QTY : parseInt(gfn_nvl(item.data.ITEM_QTY) == "" ? "0" : gfn_nvl(item.data.ITEM_QTY)),
								V_P_ITEM_UNIT_PRICE : parseInt(gfn_nvl(item.data.ITEM_UNIT_PRICE) == "" ? "0" : gfn_nvl(item.data.ITEM_UNIT_PRICE)),
								V_P_ITEM_TAXABLE_AMT : parseInt(gfn_nvl(item.data.ITEM_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_TAXABLE_AMT)),
								V_P_ITEM_VAT_AMT : parseInt(gfn_nvl(item.data.ITEM_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_VAT_AMT)),
								V_P_ITEM_DESC : gfn_nvl(item.data.ITEM_DESC),
								V_P_COST_CENTER_CODE : gfn_nvl(item.data.COST_CENTER_CODE),
								V_P_DEPT_CODE : gfn_nvl(item.data.DEPT_CODE),
								V_P_PROJECT_CODE : gfn_nvl(item.data.PROJECT_CODE),
								V_P_ACCOUNT_CODE : gfn_nvl(item.data.ACCOUNT_CODE),
								V_P_FORM_ID : p_formId,
								V_P_MENU_ID : p_menuId,
								V_P_PROC_ID : '',
								V_P_USERID : '',
								V_P_PC : ''
							})
						}
						returnData.push(param);
					});

					if(returnData.length > 0) {
						const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300ItemList.do", {listData: returnData});
						const data = await postJsonPromise;

						try {
							if (_.isEqual("S", data.resultStatus)) {
								gfn_comAlert("I0001");
								fn_search();
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
				} else {
					alert(data.resultMessage);
					fn_search();
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

	function xmlToJson(xml) {
		var obj = {};

		if (xml.nodeType == 1) {
			if (xml.attributes.length > 0) {
				obj["@attributes"] = {};
				for (var j = 0; j < xml.attributes.length; j++) {
					var attribute = xml.attributes.item(j);
					obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
				}
			}
		} else if (xml.nodeType == 3) {
			obj = xml.nodeValue;
		}

		var textNodes = [].slice.call(xml.childNodes).filter(function(node) {
			return node.nodeType === 3;
		});
		if (xml.hasChildNodes() && xml.childNodes.length === textNodes.length) {
			obj = [].slice.call(xml.childNodes).reduce(function(text, node) {
				return text + node.nodeValue;
			}, "");
		} else if (xml.hasChildNodes()) {
			for (var i = 0; i < xml.childNodes.length; i++) {
				var item = xml.childNodes.item(i);
				var nodeName = item.nodeName;
				if (typeof obj[nodeName] == "undefined") {
					obj[nodeName] = xmlToJson(item);
				} else {
					if (typeof obj[nodeName].push == "undefined") {
						var old = obj[nodeName];
						obj[nodeName] = [];
						obj[nodeName].push(old);
					}
					obj[nodeName].push(xmlToJson(item));
				}
			}
		}
		return obj;
	}

	const fn_disconnection = async function () {
		var nRow = gvwList.getRow();
		var rowData = gvwList.getRowData(nRow);

		gvwList.setCellData(nRow, gvwList.getColRef("DOC_ID"), "");
		gvwList.setCellData(nRow, gvwList.getColRef("DOC_NAME"), "");

		if(gfn_nvl(rowData) == "") return;

		const param = {
			cv_count : '0',
			getType : 'json',
			rownum: nRow,
			workType : 'U',
			params: gfnma_objectToString({
				V_P_DEBUG_MODE_YN : '',
				V_P_LANG_ID	: '',
				V_P_COMP_CODE : gv_ma_selectedApcCd,
				V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
				V_P_FI_ORG_CODE : rowData.FI_ORG_CODE,
				V_P_WRITE_DATE : rowData.WRITE_DATE,
				V_P_APPROVAL_NO : rowData.APPROVAL_NO,
				V_P_ISSUE_DATE : rowData.ISSUE_DATE,
				V_P_SEND_DATE : rowData.SEND_DATE,
				V_P_SELLER_REG_NO : rowData.SELLER_REG_NO.replaceAll("-", ""),
				V_P_SELLER_SUB_REG_NO : rowData.SELLER_SUB_REG_NO,
				V_P_CS_CODE : rowData.CS_CODE,
				V_P_SELLER_NAME : rowData.SELLER_NAME,
				V_P_SELLER_OWNER : rowData.SELLER_OWNER,
				V_P_SELLER_ADDRESS : rowData.SELLER_ADDRESS,
				V_P_SELLER_BIZ_CATEGORY : rowData.SELLER_BIZ_CATEGORY,
				V_P_SELLER_BIZ_ITEM : rowData.SELLER_BIZ_ITEM,
				V_P_BUYER_REG_NO : rowData.BUYER_REG_NO.replaceAll("-", ""),
				V_P_BUYER_SUB_REG_NO : rowData.BUYER_SUB_REG_NO,
				V_P_BUYER_NAME : rowData.BUYER_NAME,
				V_P_BUYER_OWNER : rowData.BUYER_OWNER,
				V_P_BUYER_ADDRESS : rowData.BUYER_ADDRESS,
				V_P_BUYER_BIZ_CATEGORY : rowData.BUYER_BIZ_CATEGORY,
				V_P_BUYER_BIZ_ITEM : rowData.BUYER_BIZ_ITEM,
				V_P_BUYER_BIZ_TYPE : rowData.BUYER_BIZ_TYPE,
				V_P_TOTAL_AMT : parseInt(gfn_nvl(rowData.TOTAL_AMT) == "" ? "0" : gfn_nvl(rowData.TOTAL_AMT)),
				V_P_TOTAL_TAXABLE_AMT : parseInt(gfn_nvl(rowData.TOTAL_TAXABLE_AMT) == "" ? "0" : gfn_nvl(rowData.TOTAL_TAXABLE_AMT)),
				V_P_TOTAL_VAT_AMT : parseInt(gfn_nvl(rowData.TOTAL_VAT_AMT) == "" ? "0" : gfn_nvl(rowData.TOTAL_VAT_AMT)),
				V_P_EINVOICE_CATEGORY : rowData.EINVOICE_CATEGORY,
				V_P_EINVOICE_TYPE : rowData.EINVOICE_TYPE,
				V_P_MATCH_METHOD : rowData.MATCH_METHOD,
				V_P_ISSUE_TYPE : rowData.ISSUE_TYPE,
				V_P_NOTE1 : rowData.NOTE1,
				V_P_NOTE2 : rowData.NOTE2,
				V_P_RECEIPT_OR_BILL : rowData.RECEIPT_OR_BILL,
				V_P_SELLER_EMAIL : rowData.SELLER_EMAIL,
				IV_P_BUYER_EMAIL1 : rowData._BUYER_EMAIL1,
				V_P_BUYER_EMAIL2 : rowData.BUYER_EMAIL2,
				V_P_ACCOUNT_EMP_CODE : rowData.ACCOUNT_EMP_CODE,
				V_P_TXN_DATE : rowData.TXN_DATE.replaceAll("-", ""),
				V_P_DOC_ID : rowData.DOC_ID,
				V_P_FORM_ID : p_formId,
				V_P_MENU_ID : p_menuId,
				V_P_PROC_ID : '',
				V_P_USERID : '',
				V_P_PC : ''
			})
		}
		returnData.push(param);

		if(returnData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300List.do", {listData: returnData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001");
					fn_search();
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

	const fn_import = async function () {
		let DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_DATE_FR"));
		let DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_DATE_TO"));

		var paramObj = {
			V_P_DEBUG_MODE_YN	: '',
			V_P_LANG_ID		: '',
			V_P_COMP_CODE		: gv_ma_selectedApcCd,
			V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
			V_P_DATE_FR : DATE_FR,
			V_P_DATE_TO : DATE_TO,
			V_P_JOB_NAME : strjob_name,
			V_P_INTERFACE_RUN : 'Y',
			V_P_SCHEDULENAME : '',
			V_P_COMMAND : '',
			V_P_ADD_TIME : 0,
			V_P_FREQ_TYPE : 0,
			V_P_FREQ_INTERVAL : 0,
			V_P_STEP_NAME : '',
			V_P_SUBSYSTEM : '',
			V_P_DATABASE_NAME : '',
			V_P_RETRY_ATTEMPTS : 0,
			V_P_RETRY_INTERVAL : '',
			V_P_INTERFACE_ID : strjob_name,
			V_P_FORM_ID		: p_formId,
			V_P_MENU_ID		: p_menuId,
			V_P_PROC_ID		: '',
			V_P_USERID			: '',
			V_P_PC				: ''
		};

		const postJsonPromiseForList = gfn_postJSON("/fi/far/rec/importFig3300List.do", {
			getType				: 'json',
			workType			: 'Q',
			cv_count			: '3',
			params				: gfnma_objectToString(paramObj)
		});

		const listData = await postJsonPromiseForList;
		console.log('data:', listData);

		try {
			if (_.isEqual("S", listData.resultStatus)) {
				gfn_comAlert("I0001");
				fn_search();
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

	const fn_excelUpload = async function () {
		let updatedData = gvwList.getUpdateData(true, 'i');
		let returnData = [];

		updatedData.forEach((item, index) => {
			const param = {
				cv_count : '0',
				getType : 'json',
				rownum: item.rownum,
				workType : 'N1',
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN : '',
					V_P_LANG_ID	: '',
					V_P_COMP_CODE : gv_ma_selectedApcCd,
					V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
					V_P_FI_ORG_CODE : gfn_nvl(item.data.FI_ORG_CODE),
					V_P_WRITE_DATE : gfn_nvl(item.data.WRITE_DATE),
					V_P_APPROVAL_NO : gfn_nvl(item.data.APPROVAL_NO),
					V_P_ISSUE_DATE : gfn_nvl(item.data.ISSUE_DATE),
					V_P_SEND_DATE : gfn_nvl(item.data.SEND_DATE),
					V_P_SELLER_REG_NO : gfn_nvl(item.data.SELLER_REG_NO.replaceAll("-", "")),
					V_P_SELLER_SUB_REG_NO : gfn_nvl(item.data.SELLER_SUB_REG_NO),
					V_P_CS_CODE : gfn_nvl(item.data.CS_CODE),
					V_P_SELLER_NAME : gfn_nvl(item.data.SELLER_NAME),
					V_P_SELLER_OWNER : gfn_nvl(item.data.SELLER_OWNER),
					V_P_SELLER_ADDRESS : gfn_nvl(item.data.SELLER_ADDRESS),
					V_P_SELLER_BIZ_CATEGORY : gfn_nvl(item.data.SELLER_BIZ_CATEGORY),
					V_P_SELLER_BIZ_ITEM : gfn_nvl(item.data.SELLER_BIZ_ITEM),
					V_P_BUYER_REG_NO : gfn_nvl(item.data.BUYER_REG_NO.replaceAll("-", "")),
					V_P_BUYER_SUB_REG_NO : gfn_nvl(item.data.BUYER_SUB_REG_NO),
					V_P_BUYER_NAME : gfn_nvl(item.data.BUYER_NAME),
					V_P_BUYER_OWNER : gfn_nvl(item.data.BUYER_OWNER),
					V_P_BUYER_ADDRESS : gfn_nvl(item.data.BUYER_ADDRESS),
					V_P_BUYER_BIZ_CATEGORY : gfn_nvl(item.data.BUYER_BIZ_CATEGORY),
					V_P_BUYER_BIZ_ITEM : gfn_nvl(item.data.BUYER_BIZ_ITEM),
					V_P_BUYER_BIZ_TYPE : gfn_nvl(item.data.BUYER_BIZ_TYPE),
					V_P_TOTAL_AMT : parseInt(gfn_nvl(item.data.TOTAL_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_AMT)),
					V_P_TOTAL_TAXABLE_AMT : parseInt(gfn_nvl(item.data.TOTAL_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_TAXABLE_AMT)),
					V_P_TOTAL_VAT_AMT : parseInt(gfn_nvl(item.data.TOTAL_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_VAT_AMT)),
					V_P_EINVOICE_CATEGORY : gfn_nvl(item.data.EINVOICE_CATEGORY),
					V_P_EINVOICE_TYPE : gfn_nvl(item.data.EINVOICE_TYPE),
					V_P_MATCH_METHOD : gfn_nvl(item.data.MATCH_METHOD),
					V_P_ISSUE_TYPE : gfn_nvl(item.data.ISSUE_TYPE),
					V_P_NOTE1 : gfn_nvl(item.data.NOTE1),
					V_P_NOTE2 : gfn_nvl(item.data.NOTE2),
					V_P_RECEIPT_OR_BILL : gfn_nvl(item.data.RECEIPT_OR_BILL),
					V_P_SELLER_EMAIL : gfn_nvl(item.data.SELLER_EMAIL),
					IV_P_BUYER_EMAIL1 : gfn_nvl(item.data.BUYER_EMAIL1),
					V_P_BUYER_EMAIL2 : gfn_nvl(item.data.BUYER_EMAIL2),
					V_P_ACCOUNT_EMP_CODE : gfn_nvl(item.data.ACCOUNT_EMP_CODE),
					V_P_TXN_DATE : gfn_nvl(item.data.TXN_DATE.replaceAll("-", "")),
					V_P_DOC_ID : gfn_nvl(item.data.DOC_ID),
					V_P_FORM_ID : p_formId,
					V_P_MENU_ID : p_menuId,
					V_P_PROC_ID : '',
					V_P_USERID : '',
					V_P_PC : ''
				})
			}
			returnData.push(param);
		});

		if(returnData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300List.do", {listData: returnData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					let updatedData = gvwItem.getUpdateData(true, 'i');
					let returnData = [];

					updatedData.forEach((item, index) => {
						const param = {
							cv_count: '0',
							getType: 'json',
							rownum: item.rownum,
							workType: 'N',
							params: gfnma_objectToString({
								V_P_DEBUG_MODE_YN: '',
								V_P_LANG_ID: '',
								V_P_COMP_CODE: gv_ma_selectedApcCd,
								V_P_CLIENT_CODE: gv_ma_selectedClntCd,
								V_P_APPROVAL_NO: gfn_nvl(item.data.APPROVAL_NO),
								V_P_SEQ: gfn_nvl(item.data.SEQ),
								V_P_ITEM_NAME: gfn_nvl(item.data.ITEM_NAME),
								V_P_ITEM_SPEC: gfn_nvl(item.data.ITEM_SPEC),
								V_P_ITEM_QTY: parseInt(gfn_nvl(item.data.ITEM_QTY) == "" ? "0" : gfn_nvl(item.data.ITEM_QTY)),
								V_P_ITEM_UNIT_PRICE: parseInt(gfn_nvl(item.data.ITEM_UNIT_PRICE) == "" ? "0" : gfn_nvl(item.data.ITEM_UNIT_PRICE)),
								V_P_ITEM_TAXABLE_AMT: parseInt(gfn_nvl(item.data.ITEM_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_TAXABLE_AMT)),
								V_P_ITEM_VAT_AMT: parseInt(gfn_nvl(item.data.ITEM_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_VAT_AMT)),
								V_P_ITEM_DESC: gfn_nvl(item.data.ITEM_DESC),
								V_P_COST_CENTER_CODE: gfn_nvl(item.data.COST_CENTER_CODE),
								V_P_DEPT_CODE: gfn_nvl(item.data.DEPT_CODE),
								V_P_PROJECT_CODE: gfn_nvl(item.data.PROJECT_CODE),
								V_P_ACCOUNT_CODE: gfn_nvl(item.data.ACCOUNT_CODE),
								V_P_FORM_ID: p_formId,
								V_P_MENU_ID: p_menuId,
								V_P_PROC_ID: '',
								V_P_USERID: '',
								V_P_PC: ''
							})
						}
						returnData.push(param);
					});

					if (returnData.length > 0) {
						const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3300ItemList.do", {listData: returnData});
						const data = await postJsonPromise;

						try {
							if (_.isEqual("S", data.resultStatus)) {
								gfn_comAlert("I0001");
								fn_search();
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
				} else {
					alert(data.resultMessage);
					fn_search();
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

	const fn_exclusion = async function () {
		let EXCEPT_CODE = gfn_nvl(gfnma_multiSelectGet("#EXCEPT_CODE"));
		let EXCEPT_REASON = gfnma_nvl(SBUxMethod.get("EXCEPT_REASON"));
		let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHK_YN"), true);
		let returnData = [];

		if (EXCEPT_CODE == "") {
			gfn_comAlert("E0000", "제외사유를 선택하세요.");
			return;
		}

		if(gvwListCheckedList.length == 0) {
			gfn_comAlert("E0000", "처리대상이 없습니다.")
			return;
		}

		gvwListCheckedList.forEach((item, index) => {
			let data = gvwList.getRowData(item);
			const param = {
				cv_count : '0',
				getType : 'json',
				rownum: item,
				workType : 'EXCEPT',
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN : '',
					V_P_LANG_ID	: '',
					V_P_COMP_CODE : gv_ma_selectedApcCd,
					V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
					V_P_APPROVAL_NO : data.APPROVAL_NO,
					V_P_EXCEPT_CODE : EXCEPT_CODE,
					V_P_EXCEPT_REASON : EXCEPT_REASON,
					V_P_EXCEPT_AMOUNT : 0,
					V_P_FORM_ID : p_formId,
					V_P_MENU_ID : p_menuId,
					V_P_PROC_ID : '',
					V_P_USERID : '',
					V_P_PC : ''
				})
			}
			returnData.push(param);
		});

		if(returnData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/far/rec/exclusionFig3300List.do", {listData: returnData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001");
					fn_search();
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

	const fn_cancel = async function () {
		let EXCEPT_CODE = gfn_nvl(gfnma_multiSelectGet("#EXCEPT_CODE"));
		let EXCEPT_REASON = gfnma_nvl(SBUxMethod.get("EXCEPT_REASON"));
		let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHK_YN"), true);
		let returnData = [];

		if (EXCEPT_CODE == "") {
			gfn_comAlert("E0000", "제외사유를 선택하세요.");
			return;
		}

		if(gvwListCheckedList.length == 0) {
			gfn_comAlert("E0000", "처리대상이 없습니다.")
			return;
		}

		gvwListCheckedList.forEach((item, index) => {
			let data = gvwList.getRowData(item);
			const param = {
				cv_count : '0',
				getType : 'json',
				rownum: item,
				workType : 'CANCEL',
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN : '',
					V_P_LANG_ID	: '',
					V_P_COMP_CODE : gv_ma_selectedApcCd,
					V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
					V_P_APPROVAL_NO : data.APPROVAL_NO,
					V_P_EXCEPT_CODE : EXCEPT_CODE,
					V_P_EXCEPT_REASON : EXCEPT_REASON,
					V_P_EXCEPT_AMOUNT : 0,
					V_P_FORM_ID : p_formId,
					V_P_MENU_ID : p_menuId,
					V_P_PROC_ID : '',
					V_P_USERID : '',
					V_P_PC : ''
				})
			}
			returnData.push(param);
		});

		if(returnData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/far/rec/exclusionFig3300List.do", {listData: returnData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001");
					fn_search();
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
</script>
