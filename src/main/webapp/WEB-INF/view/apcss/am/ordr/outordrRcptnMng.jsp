<%
 /**
  * @Class Name : outordrRcptnMng.jsp
  * @Description : 발주수신관리 화면
  * @author SI개발부
  * @since 2024.10.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.23   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<style>
		span#srch-dtp-wrhsYmd{
			display: flex!important;
		}
		span.sbux-pik-wrap{
			display: flex!important;
			gap: 5px;
		}
	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 발주정보조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btn-search"
						name="btn-search"
						uitype="normal"
						class="btn btn-sm btn-outline-dark"
						text="조회"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>대형마트구분</th>
							<td class="td_input" colspan="2" style="border-right: hidden;border-top: hidden">
								<sbux-select
										unselected-text="선택"
										uitype="single"
										id="slt-lgszMrktCd"
										name="slt-lgszMrktCd"
										class="form-control input-sm input-sm-ast inpt_data_reqed"
										jsondata-ref="jsonComLgszMrkt"
										onchange=""
								/>
							</td>
							<td style="border-top: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>납기일자</th>
							<td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
								<sbux-datepicker
										uitype="range"
										id="srch-dtp-wrhsYmd"
										name="srch-dtp-wrhsYmd"
										date-format="yyyy-mm-dd"
										class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
										wrap-class="displayFlex"
										wrap-style="border:0;padding:0;"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-button
										id="btn-ordrRcptn"
										name="btn-ordrRcptn"
										uitype="normal"
										class="btn btn-xs btn-outline-dark"
										text="수신처리"
										onclick="fn_ordrRcptn"
								></sbux-button>
							</td>
					        <td colspan="3" style="border-top: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">접수여부</th>
							<td class="td_input" colspan="2" style="border-right: hidden;">
								<sbux-select
										id="srch-slt-receiptYn"
										name="srch-slt-receiptYn"
										uitype="single"
										unselected-text="전체"
										jsondata-ref="jsonReceiptYn"
										class="form-control input-sm"
								></sbux-select>
							</td>
							<td></td>
						    <th scope="row" class="th_bg">상품명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
										id="srch-inp-mrktGdsNm"
										name="srch-inp-mrktGdsNm"
										uitype="text"
										maxlength="40"
										class="form-control input-sm"
								></sbux-input>
							</td>
							<th scope="row" class="th_bg">상품코드</th>
							<td colspan="3" class="td_input">
								<sbux-input
										id="srch-inp-mrktGdsCd"
										name="srch-inp-mrktGdsCd"
										uitype="text"
										maxlength="40"
										class="form-control input-sm"
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>발주 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-outordr">0</span>건)</span>
						</li>
					</ul>
					<div style="display:flex;vertical-align:middle;float:right;margin-right:auto;gap: 5px">
						<!--<div style="display: flex"></div>-->
						<sbux-button
								id="btn-receipt"
								name="btn-receipt"
								uitype="normal"
								onclick="fn_receipt"
								class="btn btn-sm btn-outline-dark"
								text="접수"
						></sbux-button>
						<sbux-button
								id="btn-receiptCncl"
								name="btn-receiptCncl"
								uitype="normal"
								onclick="fn_receiptCncl"
								class="btn btn-sm btn-outline-dark"
								text="접수취소"
						></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordr" style="width:100%;height:533px;"></div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdOutordr;
	var jsonOutordr 		= [];
	var jsonReceiptYn		= [
		{text: "접수", value: "Y"},
		{text: "미접수", value: "N"}
	];
	var jsonComLgszMrkt		= [];


	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	/**
     * @name fn_init
     * @description 화면 init
     */
	const fn_init = async function() {
		const firstYmd = gfn_dateFirstYmd(new Date());
		const nowYmd = gfn_dateToYmd(new Date());
		SBUxMethod.set("srch-dtp-wrhsYmd", firstYmd + "," + nowYmd);
		await gfn_setComCdSBSelect('slt-lgszMrktCd', jsonComLgszMrkt,	'LGSZ_MRKT_CD');

		fn_createGrid();
	}


	/**
     * @name fn_createGrid
     * @description 발주정보 그리드 생성
     */
	const fn_createGrid = function(lgszMrktCd) {

        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordr';
	    SBGridProperties.id = 'grdOutordr';
	    SBGridProperties.jsonref = 'jsonOutordr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    //SBGridProperties.selectmode = 'byrows';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.mergecells = 'bycol';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.frozencols = 6;
        SBGridProperties.columns = [
			{
				caption: [""],
				ref: 'checkedYn',
				type: 'checkbox',
				width: '50px',
				style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
				typeinfo: {
					fixedcellcheckbox: {
						usemode: true,
						rowindex: 0,
						deletecaption: false
					},
					checkedvalue: 'Y',
					uncheckedvalue: 'N',
					ignoreupdate: true,
				},
				merge : false
			},
			{
				caption: ['대형마트구분'],
				ref: 'lgszMrktNm',
				width: '100px',
				type: 'output',
				tyle:'text-align:left',
			},
            {
            	caption: ['접수여부'],
            	ref: 'receiptYn',
            	width: '60px',
            	type: 'combo',
            	style:'text-align: center',
            	typeinfo : {
            		ref:'jsonReceiptYn',
            		label:'text',
            		value:'value'
            	},
				disabled: true,
				merge : false
            },
			{
				caption: ['납기일자'],
				ref: 'wrhsYmd',
				width: '120px',
				type: 'output',
				style:'text-align: center',
				format : {
					type: 'date',
					rule: 'yyyy-mm-dd',
					origin: 'yyyymmdd'
				}
			},
			{
				caption: ['발주일자'],
				ref: 'outordrYmd',
				width: '100px',
				type: 'output',
				style:'text-align: center',
				format : {
					type: 'date',
					rule: 'yyyy-mm-dd',
					origin: 'yyyymmdd'
				}
			},
			{
				caption: ['발주번호'],
				ref: 'outordrno',
				width: '140px',
				type: 'output',
				tyle:'text-align:left'
			},
			{
				caption: ['발주합계금액 (원)'],
				ref: 'totOutordrAmt',
				width: '120px',
				type: 'output',
				style:'text-align: right',
				typeinfo : {
					mask : {alias : 'numeric'}
				}, format : {
					type:'number',
					rule:'#,###'
				}
			},
            {
				caption: ['주문자'],
				ref:'ordrr',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
			{
				caption: ['센터명'],
				ref: 'cntrNm',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
            {
				caption: ['공급자명'],
				ref: 'splrNm',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
			{
				caption: ['가상창고코드'],
				ref: 'vrWarehouseCd',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
			{
				caption: ['가상창고명'],
				ref: 'vrWarehouseNm',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
            {
				caption: ['상품코드'],
				ref: 'mrktGdsCd',
				width: '150px',
				type: 'output',
				style:'text-align: center',
				merge : false
			},
			{
				caption: ['상품명'],
				ref: 'mrktGdsNm',
				width: '150px',
				type: 'output',
				style:'text-align:left',
				merge : false
			},
			{
				caption: ['점포코드'],
				ref: 'storCd',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
			{
				caption: ['점포명'],
				ref: 'storNm',
				width: '120px',
				type: 'output',
				style:'text-align:left'
			},
            {
            	caption: ['입수'],
            	ref: 'bxGdsQntt',
            	width: '100px',
            	type: 'output',
            	style:'text-align: right',
				format : {
					type:'number',
					rule:'#,###'
				},
				merge : false
            },
            {
            	caption: ['발주수량'],
            	ref: 'outordrQntt',
            	width: '70px',
            	type: 'output',
            	style:'text-align: right',
				format : {
					type:'number',
					rule:'#,###'
				},
				merge : false
            },
			{
				caption: ['단위'],
				ref: 'outordrUnit',
				width: '70px',
				type: 'output',
				style:'text-align: center',
				merge : false
			},
			{
				caption: ['발주금액 (원)'],
				ref: 'outordrAmt',
				width: '100px',
				type: 'output',
				style:'text-align: right',
				typeinfo : {
					mask : {
						alias : 'numeric'
					}
				},
				format : {
					type:'number',
					rule:'#,###'
				},
				merge : false
			},
            {
            	caption: ['낱개수량'],
            	ref: 'pieceQntt',
            	width: '70px',
            	type: 'output',
            	style:'text-align: right',
				format : {
					type:'number',
					rule:'#,###'
				},
				merge : false
            },
            {
            	caption: ['낱개단가 (원)'],
            	ref: 'pieceUntprc',
            	width: '100px',
            	type: 'output',
            	style:'text-align: right',
            	typeinfo : {
            		mask : {alias : 'numeric'}
            	},
            	format : {
            		type:'number',
            		rule:'#,###'
            	},
				merge : false
            },
            {
            	caption: ['발주단가 (원)'],
            	ref: 'outordrUntprc',
            	width: '100px',
            	type: 'output',
            	style:'text-align: right',
            	typeinfo : {
            		mask : {alias : 'numeric'}
            	}, format : {
            		type:'number',
            		rule:'#,###'
            	},
				merge : false
            },
        ];

        grdOutordr = _SBGrid.create(SBGridProperties);

		grdOutordr.bind('valuechanged' , fn_grdOutordrValueChanged);
    }


	/**
	 * @name fn_grdOutordrValueChanged
	 * @description 체크박스 선택 event
	 * @function
	 */
	const fn_grdOutordrValueChanged = function() {

		const nRow = grdOutordr.getRow();
		const nCol = grdOutordr.getCol();

		const usrAttr = grdOutordr.getColUserAttr(nCol);

		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			switch (usrAttr.colNm) {
				case "checkedYn":
					const rowData = grdOutordr.getRowData(nRow);

					if (_.isEqual("Y", rowData.checkedYn)) {
						const outordrno = rowData.outordrno;
						const allData = grdOutordr.getGridDataAll();

						for ( let i=1; i<=allData.length; i++ ){
							const targetRow = grdOutordr.getRowData(i, false);

							if (!_.isEqual("Y", targetRow.checkedYn) && _.isEqual(outordrno, targetRow.outordrno)) {
								targetRow.checkedYn = "Y";
							}
						}

						grdOutordr.refresh({"focus":false});
					}

					break;

				default:
					break;
			}
		}


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
	/**
     * @name fn_excelDwnld
     * @description 엑셀 다운로드
     */
    function fn_excelDwnld() {
    	grdOutordr.exportLocalExcel(
				"발주수신정보",
				{
					bSaveLabelData: true,
					bNullToBlank: true,
					bSaveSubtotalValue: true,
					bCaptionConvertBr: true,
					arrSaveConvertText: true
				}
		);
    }

	/**
     * @name fn_search
     * @description 조회버튼
     */
    const fn_search = async function() {

		const wrhsYmdFrom = SBUxMethod.get('srch-dtp-wrhsYmd_from');    // 입고일자from
		const wrhsYmdTo = SBUxMethod.get('srch-dtp-wrhsYmd_to');        // 입고일자to

		if (gfn_isEmpty(wrhsYmdFrom)) {
			gfn_comAlert("W0001", "납기일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (gfn_isEmpty(wrhsYmdTo)) {
			gfn_comAlert("W0001", "납기일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		const lgszMrktCd = SBUxMethod.get('slt-lgszMrktCd');
		if (gfn_isEmpty(lgszMrktCd)) {
			gfn_comAlert("W0001", "대형마트구분");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		await fn_setGrdOutordr();
    }

	/**
     * @name fn_setGrdOutordr
     * @description 발주정보 조회
     */
	const fn_setGrdOutordr = async function() {
		const wrhsYmdFrom = SBUxMethod.get('srch-dtp-wrhsYmd_from');
		const wrhsYmdTo = SBUxMethod.get('srch-dtp-wrhsYmd_to');
		const lgszMrktCd = SBUxMethod.get('slt-lgszMrktCd');
		const receiptYn = SBUxMethod.get('srch-slt-receiptYn');
		const mrktGdsNm = gfn_nvl(SBUxMethod.get('srch-inp-mrktGdsNm'));
		const mrktGdsCd = gfn_nvl(SBUxMethod.get('srch-inp-mrktGdsCd'));

		const param = {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			lgszMrktCd: lgszMrktCd,
			receiptYn: receiptYn,
			mrktGdsNm: mrktGdsNm,
			mrktGdsCd: mrktGdsCd,
		}

		jsonOutordr.length = 0;

        try {

        	let postJsonPromise = gfn_postJSON("/am/ordr/selectMrktOrdrDtlList.do", param);
            let data = await postJsonPromise;

  			if (!_.isEqual("S", data.resultStatus)) {
  				gfn_comAlert(data.resultCode, data.resultMessage);
  				return;
  			}

        	data.resultList.forEach((item, index) => {
				jsonOutordr.push(item);
			});

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        } finally {
			grdOutordr.refresh();
			document.querySelector('#cnt-outordr').innerText = jsonOutordr.length;
			grdOutordr.clearFixedCellChecked(0, 0);
		}
	}

	/**
	 * @name fn_receipt
	 * @description 발주정보 접수
	 */
	const fn_receipt = async function() {

		const receiptList = [];

		const allData = grdOutordr.getGridDataAll();

		for ( let i=0; i<allData.length; i++ ){
			const rowData = allData[i];

			if (_.isEqual("Y", rowData.checkedYn) && _.isEqual("N", rowData.receiptYn)) {
				receiptList.push(rowData);
			}
		}

		if (receiptList.length == 0) {
			gfn_comAlert("W0003", "접수처리");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "접수")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		const param = {
			ordrApcCd: gv_selectedApcCd,
			dtlList: receiptList
		}

		try {
			const postJsonPromise = gfn_postJSON("/am/ordr/insertOutordrReceipt.do", param);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				await fn_search();
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);
			}

		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	/**
	 * @name fn_receiptCncl
	 * @description 발주정보 접수 취소
	 */
	const fn_receiptCncl = async function() {

		const receiptList = [];

		const allData = grdOutordr.getGridDataAll();

		for ( let i=0; i<allData.length; i++ ){
			const rowData = allData[i];

			if (_.isEqual("Y", rowData.checkedYn) && _.isEqual("Y", rowData.receiptYn)) {
				receiptList.push(rowData);
			}
		}

		if (receiptList.length == 0) {
			gfn_comAlert("W0003", "접수취소");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "접수취소")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		const param = {
			ordrApcCd: gv_selectedApcCd,
			dtlList: receiptList
		}

		try {
			const postJsonPromise = gfn_postJSON("/am/ordr/deleteOutordrReceipt.do", param);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				await fn_search();
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);
			}

		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * @name fn_ordrRcptn
	 * @description 발주정보 수신 처리
	 */
	const fn_ordrRcptn = async function() {

		// set param
		const lgszMrktCd = SBUxMethod.get("slt-lgszMrktCd");
		const wrhsYmdFrom = SBUxMethod.get('srch-dtp-wrhsYmd_from');    // 입고일자from
		const wrhsYmdTo = SBUxMethod.get('srch-dtp-wrhsYmd_to');        // 입고일자to

		if (gfn_isEmpty(lgszMrktCd)) {
			gfn_comAlert("W0001", "대형마트구분");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (gfn_isEmpty(wrhsYmdFrom)) {
			gfn_comAlert("W0001", "납기일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (gfn_isEmpty(wrhsYmdTo)) {
			gfn_comAlert("W0001", "납기일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (wrhsYmdTo > gfn_addDate(wrhsYmdFrom, 2)) {
			gfn_comAlert("W0021", "납기일자 기간", "3일 이내");		//	W0021 {0}은/는 {1}만 가능합니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "발주정보수신")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const rcptOutordr = {
				apcCd: gv_selectedApcCd,
				lgszMrktCd: lgszMrktCd,
				crtrYmdFrom: wrhsYmdFrom,
				crtrYmdTo: wrhsYmdTo,
				crtrYmdType: "3"
			}

        try {

    		const postJsonPromise = gfn_postJSON(
					"/am/ordr/insertOutordrRcpt.do",
					rcptOutordr
				);	// 프로그램id 추가
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				await fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}

        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		await fn_init();
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>