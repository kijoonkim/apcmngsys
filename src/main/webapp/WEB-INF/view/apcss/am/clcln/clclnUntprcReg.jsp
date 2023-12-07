<%
 /**
  * @Class Name : ClclnUntprcReg.jsp
  * @Description : 정산단가등록 화면
  * @author SI개발부
  * @since 2023.10.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.10.23   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 정산단가등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="조회"
						onclick="fn_search"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="저장"
						onclick="fn_save"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">정산기준</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-clclnCrtrCd"
											name="srch-slt-clclnCrtrCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm input-sm-ast"
											jsondata-ref="jsonComClclnCrtrCd"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonApcItem"
											onchange="fn_onChangeSrchItemCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-vrtyCd"
											name="srch-slt-vrtyCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonApcVrty"
											onchange="fn_onChangeSrchVrtyCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="4"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>정산단가 목록</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-clcln">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdClclnUntprc" style="width:100%;height:579px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">


	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComClclnCrtrCd	= [];	// 정산기준 	clclnCrtr	검색

	/* SBGrid */
	var grdClclnUntprc;
    /* SBGrid Data (JSON) */
	var jsonClclnUntprc = [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd),						// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 		gv_selectedApcCd),						// 품종
			gfn_setComCdSBSelect('srch-slt-clclnCrtrCd', 	jsonComClclnCrtrCd, 	'CLCLN_CRTR_CD')	// 정산기준
		]);
	}


	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		fn_createGrid();

		let result = await Promise.all([
				fn_initSBSelect()
			]);

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});


	function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdClclnUntprc';
	    SBGridProperties.id = 'grdClclnUntprc';
	    SBGridProperties.jsonref = 'jsonClclnUntprc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
        SBGridProperties.columns = [
			{caption : ["<input type='checkbox' onchange='fn_checkAll(grdClclnUntprc, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ['정산기준'], ref: 'clclnCrtrNm', width: '100px', type : 'output', style: 'text-align:center'},
            {caption: ['품목'], ref: 'itemNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['등급'], ref: 'grdNm', width: '80px', type: 'output', style: 'text-align:center'},
            {
				caption: ["정산단가"],
				ref: 'clclnUntprc',
				datatype: 'number',
				type:'input',
				width:'100px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "clclnUntprc"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 14,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
			{
				caption: ["단중(kg)"],
				ref: 'clclnUnitWght',
				datatype: 'number',
				type:'input',
				width:'100px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "clclnUnitWght"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 14,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
            {caption: [""], ref: '_', type:'output', width:'1px'},
            {caption: ["정산기준코드"], ref: 'clclnCrtrCd', type:'output', hidden: true},
            {caption: ["상품구분코드"], ref: 'gdsSeCd', type:'output', hidden: true},
            {caption: ["품목코드"], ref: 'itemCd', type:'output', hidden: true},
            {caption: ["품종코드"], ref: 'vrtyCd', type:'output', hidden: true},
            {caption: ["등급코드"], ref: 'grdCd', type:'output', hidden: true},
        ];

        grdClclnUntprc = _SBGrid.create(SBGridProperties);
        grdClclnUntprc.bind('valuechanged', fn_grdClclnUntprcValueChanged);
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
    	grdClclnUntprc.exportLocalExcel("정산단가", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

 	/**
     * @name fn_grdClclnPrfmncValueChanged
     * @description 정산실적 변경 event 처리
     * @function
     */
	const fn_grdClclnUntprcValueChanged = function() {
		var nRow = grdClclnUntprc.getRow();
		var nCol = grdClclnUntprc.getCol();

		const usrAttr = grdClclnUntprc.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdClclnUntprc.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {
				case "clclnUntprc":
				case "clclnUnitWght":
					rowData.checkedYn = "Y";
					grdClclnUntprc.refresh();
					break;

				default:
					return;
			}
		}
	}
 	
	/**
	 * @name fn_checkAll
	 * @description 전체 선택 체크박스
	 */
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checkedYn");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length; i++) {
        	grid.setCol(getColRef);
        	grid.clickCell(i+1, getColRef);
            grid.setCellData(i+1, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
    }


	/**
	 * common button action
	 */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {

		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

 	/**
     * @name fn_delete
     * @description 삭제 버튼
     */
 	const fn_delete = async function() {

 	}

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

		const allData = grdClclnUntprc.getGridDataAll();

		const clclnUntprcList = [];

		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				clclnUntprcList.push({
					apcCd: item.apcCd,
					gdsSeCd: item.gdsSeCd,
					clclnCrtrCd: item.clclnCrtrCd,
					itemCd: item.itemCd,
					vrtyCd: item.vrtyCd,
					grdCd: item.grdCd,
					clclnUntprc: item.clclnUntprc,
					clclnUnitWght: item.clclnUnitWght
    			});
    		}
		});

		if (clclnUntprcList.length == 0) {
			gfn_comAlert("W0005", "저장할 대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	const postJsonPromise = gfn_postJSON("/am/clcln/updateClclnUntprcList.do", clclnUntprcList);
		const data = await postJsonPromise;

        try {
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

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	fn_setGrdClclnUntprc();
	}

    /**
     * @name fn_setGrdClclnUntprc
     * @description 정산내역 조회
     */
	const fn_setGrdClclnUntprc = async function() {

   		let clclnCrtrCd = SBUxMethod.get("srch-slt-clclnCrtrCd");	// 정산기준코드
   		let itemCd = SBUxMethod.get("srch-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종

		const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnUntprcList.do", {
			apcCd: gv_selectedApcCd,
			clclnCrtrCd: clclnCrtrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
          	// pagination
  	  		pagingYn : 'N',
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonClclnUntprc.length = 0;
          	data.resultList.forEach((item, index) => {
          		const clclnUntprc = {
          				apcCd: item.apcCd,
          				itemCd: item.itemCd,
          				itemNm: item.itemNm,
          				vrtyCd: item.vrtyCd,
          				vrtyNm: item.vrtyNm,
          				clclnCrtrCd: item.clclnCrtrCd,
          				clclnCrtrNm: item.clclnCrtrNm,
          				grdCd: item.grdCd,
          				grdNm: item.grdNm,
          				gdsSeCd: item.gdsSeCd,
          				clclnUntprc: item.clclnUntprc,
          				clclnUnitWght: item.clclnUnitWght
  				}

          		jsonClclnUntprc.push(clclnUntprc);
  			});

          	totalRecordCount = jsonClclnUntprc.length;
          	grdClclnUntprc.refresh();

          	document.querySelector('#cnt-clcln').innerText = totalRecordCount;

          } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
          }
	}


	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {

		let vrtyCd = obj.value;

		if (gfn_isEmpty(vrtyCd)) {
			return;
		}

		const vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd});
		const itemCd = vrtyInfo.mastervalue;

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>