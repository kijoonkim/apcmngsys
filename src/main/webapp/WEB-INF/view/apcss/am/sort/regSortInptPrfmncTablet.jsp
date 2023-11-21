<%
 /**
  * @Class Name : regSortInptPrfmncTablet.jsp
  * @Description : 선별실적등록 태블릿 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철		최초 생성
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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 선별투입등록 태블릿 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						text="초기화"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						text="삭제"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
					></sbux-button>
					<sbux-button
						id="btnClose"
						name="btnClose"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_close"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 1%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 1%">
						<col style="width: 19%">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">
								<span class="data_required" ></span>선별기
							</th>
							<td colspan="6" class="td_input"  style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-fcltCd"
									name="dtl-slt-fcltCd"
									uitype="single"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComFclt"
								></sbux-select>
							</td>
							<td colspan="5" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-fxngFclt"
										name="dtl-chk-fxngFclt"
										uitype="normal"
										text="고정"
										class="check"
									></sbux-checkbox>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">
								<span class="data_required" ></span>팔레트번호
							</th>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-pltno"
									name="dtl-inp-pltno"
									uitype="text"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-button
									id="dtl-btn-rawMtrInvntr"
									name="dtl-btn-rawMtrInvntr"
									class="btn btn-xs btn-outline-dark"
									text="조회"
									uitype="normal"
									onclick="fn_choiceRawMtrInvntr"
								></sbux-button>
						    </td>
						    <td colspan="3"></td>
			            </tr>
			            <tr>
							<th scope="row" class="th_bg">재고정보</th>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-wrhsno" name="dtl-inp-wrhsno" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-invntrQntt" name="dtl-inp-invntrQntt" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-invntrWght" name="dtl-inp-invntrWght" uitype="hidden"></sbux-input>
								<sbux-label
									id="dtl-lbl-invntr"
									name="dtl-lbl-invntr"
									uitype="normal"
									text=""
									class="bold"
								></sbux-label>
							</td>
						    <td colspan="5"></td>
			            </tr>
						<tr>
							<th scope="row" class="th_bg"><sbux-label id="dtl-lbl-sortCmndnoIndct" name="dtl-lbl-sortCmndnoIndct" uitype="normal" text="투입지시번호" class="bold"></sbux-label></th>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-sortCmndno" name="dtl-inp-sortCmndno" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-sortCmndSn" name="dtl-inp-sortCmndSn" uitype="hidden"></sbux-input>
								<sbux-input
									id="dtl-inp-sortCmndnoIndct"
									name="dtl-inp-sortCmndnoIndct"
									uitype="text"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-button
									id="dtl-btn-sortCmnd"
									name="dtl-btn-sortCmnd"
									class="btn btn-xs btn-outline-dark"
									text="조회"
									uitype="modal"
									target-id="modal-sortCmndno"
									onclick="fn_choiceSortCmnd"
								></sbux-button>
						    </td>
						    <td colspan="3"></td>
					    </tr>
						<tr>
							<th scope="row" class="th_bg">
								<span class="data_required" ></span>투입일자
							</th>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-datepicker
									id="dtl-dtp-inptYmd"
									name="dtl-dtp-inptYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange"
									style="width:100%;"
								></sbux-datepicker>
						    </td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">
								<span class="data_required" ></span>투입수량/중량
							</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-inptQntt"
									name="dtl-inp-inptQntt"
									uitype="text"
									class="form-control input-sm inpt_data_reqed"
									placeholder=""
									title=""
									autocomplete="off"
									onchange="fn_onChangeInptQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="4" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-inptWght"
									name="dtl-inp-inptWght"
									uitype="text"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder=""
									title=""
									autocomplete="off"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="5" class="td_input">
								<label class="bold">Kg</label>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-itemCd" name="dtl-inp-itemCd" uitype="hidden"></sbux-input>
								<sbux-input
									id="dtl-inp-itemNm"
									name="dtl-inp-itemNm"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									title=""
									readonly
								></sbux-input>
							</td>
							<td colspan="4" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-vrtyCd" name="dtl-inp-vrtyCd" uitype="hidden"></sbux-input>
								<sbux-input
									id="dtl-inp-vrtyNm"
									name="dtl-inp-vrtyNm"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									title=""
									readonly
								></sbux-input>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">생산자</th>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									readonly
								></sbux-input>
							</td>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-prdcrCd"
									name="dtl-inp-prdcrCd"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									readonly
								></sbux-input>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고일자/창고</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-label
									id="dtl-lbl-wrhsYmd"
									name="dtl-lbl-wrhsYmd"
									uitype="normal"
									class="bold"
									mask="{'alias':'yyyy-mm-dd','autoUnmask':true}"
								></sbux-label>
							</td>
							<td colspan="4" class="td_input" style="border-right:hidden;">
								<sbux-label
									id="dtl-lbl-warehouseSeNm"
									name="dtl-lbl-warehouseSeNm"
									uitype="normal"
									text=""
									class="bold"
								></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">박스종류</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-label
									id="dtl-lbl-bxKndNm"
									name="dtl-lbl-bxKndNm"
									uitype="normal"
									text=""
									class="bold"
								></sbux-label>
							</td>
							<td colspan="9"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>선별투입 내역</span>
							<span style="font-size:12px">(기준일자 : 
								<sbux-label
									id="crtr-ymd"
									name="crtr-ymd"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label> , 조회건수 <span id="cnt-inpt">0</span>건)
							</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdSortInpt" style="height:175px;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
		</div>
	</section>

    <!-- 원물재고 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-rawMtrInvntr"
	        name="modal-rawMtrInvntr"
	        uitype="middle"
	        header-title="원물재고 선택"
	        body-html-id="body-modal-rawMtrInvntr"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:800px"
        ></sbux-modal>
    </div>
    <div id="body-modal-rawMtrInvntr">
    	<jsp:include page="../../am/popup/rawMtrInvntrPopup.jsp"></jsp:include>
    </div>

	<!-- 선별지시번호 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-sortCmndno"
        	name="modal-sortCmndno"
        	uitype="middle"
        	header-title="선별지시번호 선택"
        	body-html-id="body-modal-sortCmndno"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-sortCmndno">
    	<jsp:include page="../../am/popup/sortCmndnoPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	/* SB Select */
	var jsonComFclt			= [];	// 설비 		SORT_FCLT_CD

    /* SBGrid */
    var grdSortInpt;

    /* SBGrid Data (JSON) */
    var jsonSortInpt = [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
		 	gfn_setComCdSBSelect('dtl-slt-fcltCd', jsonComFclt, 'SORT_FCLT_CD', gv_selectedApcCd),		// 설비
	 	]);
	}

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		let nowYmd = gfn_dateToYmd(new Date());

		SBUxMethod.set("dtl-dtp-inptYmd", nowYmd);

		let result = await Promise.all([
				fn_initSBSelect()
			]);

		fn_reset();
		fn_createGrid();
	}


    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_dtpChange = function(){
		let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");
		let toDayYmd = gfn_dateToYmd(new Date());
		if(gfn_diffDate(toDayYmd, inptYmd) < 0){
			gfn_comAlert("E0000", "투입일자는 금일 이전으로 등록 할 수 없습니다."); //W0001{0}
			SBUxMethod.set("dtl-dtp-inptYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortInpt';
	    SBGridProperties.id = 'grdSortInpt';
	    SBGridProperties.jsonref = 'jsonSortInpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'50px', style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["투입일자"],		ref: 'inptYmd',      		type:'output',  width:'90px',    style:'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ["선별기명"], 		ref: 'fcltNm',     	type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["팔레트번호"], 		ref: 'pltno',    	type:'output',  width:'110px',    style:'text-align:center'},
            {caption: ["투입지시번호"],  	ref: 'sortCmndno',  type:'output',  width:'110px',    style:'text-align:center'},
            {caption: ["품목"],	    	ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["품종"],	    	ref: 'vrtyNm', 		type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["투입수량"],  		ref: 'qntt',   		type:'output',  width:'60px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["투입중량"],  		ref: 'wght',   		type:'output',  width:'90px',   style:'text-align:right',
            	format : {type:'number', rule:'#,### kg'}
            },
            {caption: ["생산자"],  		ref: 'prdcrNm',   		type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["입고일자"],  		ref: 'wrhsYmd', 		type:'output',  width:'90px',    style:'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ["박스종류"],  		ref: 'bxKndNm', 		type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["원물창고"], 		ref: 'warehouseSeNm',	type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["비고"], 			ref: 'rmrk',  			type:'output',  width:'60px',    style:'text-align:center'},
            {caption: ["입고번호"],		ref: 'wrhsno', 			type:'output',  hidden: true},
            {caption: ["투입순번"],		ref: 'inptSn', 			type:'output',  hidden: true},
            {caption: ["선별번호"],		ref: 'sortno', 			type:'output',  hidden: true},
        ];

        grdSortInpt = _SBGrid.create(SBGridProperties);
    }

	/**
	 * @name fn_reset
	 * @description form reset
	 */
    const fn_reset = function() {

    	if (!SBUxMethod.get("dtl-chk-fxngFclt")["dtl-chk-fxngFclt"]) {
    		SBUxMethod.set("dtl-slt-fcltCd", null);
    	}

		SBUxMethod.set("dtl-inp-pltno", null);
		SBUxMethod.attr("dtl-inp-pltno", "readonly", "false");
		SBUxMethod.set("dtl-inp-wrhsno", null);
		SBUxMethod.set("dtl-inp-invntrQntt", null);
		SBUxMethod.set("dtl-inp-invntrWght", null);

		SBUxMethod.set("dtl-inp-sortCmndno", null);
		SBUxMethod.set("dtl-inp-sortCmndSn", null);
		SBUxMethod.set("dtl-inp-sortCmndnoIndct", null);
		SBUxMethod.attr("dtl-inp-sortCmndnoIndct", "readonly", "false");

		let nowYmd = gfn_dateToYmd(new Date());
		SBUxMethod.set("dtl-dtp-inptYmd", nowYmd);
		SBUxMethod.set("dtl-inp-inptQntt", null);
		SBUxMethod.set("dtl-inp-inptWght", null);
		SBUxMethod.set("dtl-inp-itemCd", null);
		SBUxMethod.set("dtl-inp-itemNm", "");
		SBUxMethod.set("dtl-inp-vrtyCd", null);
		SBUxMethod.set("dtl-inp-vrtyNm", "");
		SBUxMethod.set("dtl-inp-prdcrCd", null);
		SBUxMethod.set("dtl-inp-prdcrNm", "");

		SBUxMethod.set("dtl-lbl-wrhsYmd", "");
		SBUxMethod.set("dtl-lbl-warehouseSeNm", "");
		SBUxMethod.set("dtl-lbl-bxKndNm", "");

		SBUxMethod.set("dtl-lbl-invntr", "");
    }



	/**
     * @name fn_delete
     * @description 투입 삭제 : 그리드 선택 투입목록 삭제
     */
	const fn_delete = async function() {

		const allData = grdSortInpt.getGridDataAll();

		const sortInptPrfmncList = [];
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				sortInptPrfmncList.push({
					wrhsno: item.wrhsno,
					inptSn: item.inptSn
				});
    		}
		});

		if (sortInptPrfmncList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "투입실적 삭제")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }

		const sortMng = {
	    		apcCd: gv_selectedApcCd,
	    		sortInptPrfmncList: sortInptPrfmncList
	    	}

    	const postJsonPromise = gfn_postJSON("/am/sort/deleteSortInpt.do", sortMng);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }

    }


	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		const sortInptPrfmncList = [];

		let fcltCd = SBUxMethod.get("dtl-slt-fcltCd");
		let pltno = SBUxMethod.get("dtl-inp-pltno");
		let wrhsno = SBUxMethod.get("dtl-inp-wrhsno");
		let sortCmndno = SBUxMethod.get("dtl-inp-sortCmndno");
		let sortCmndSn = SBUxMethod.get("dtl-inp-sortCmndSn");

		let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");

		let inptQntt = parseInt(SBUxMethod.get("dtl-inp-inptQntt")) || 0;
		let inptWght = parseInt(SBUxMethod.get("dtl-inp-inptWght")) || 0;

		let invntrQntt = parseInt(SBUxMethod.get("dtl-inp-invntrQntt")) || 0;
		let invntrWght = parseInt(SBUxMethod.get("dtl-inp-invntrWght")) || 0;


		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0001", "선별기");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(pltno)) {
			gfn_comAlert("W0005", "팔레트번호");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (gfn_isEmpty(inptYmd)) {
			gfn_comAlert("W0005", "투입일자");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (inptQntt <= 0) {
			gfn_comAlert("W0005", "투입수량");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (inptQntt > invntrQntt) {
			gfn_comAlert("W0014", "투입수량", "재고수량");		//	W0014	{0}이/가 {1} 보다 큽니다.
			return;
		}
		if (inptWght > invntrWght) {
			gfn_comAlert("W0014", "투입중량", "재고중량");		//	W0014	{0}이/가 {1} 보다 큽니다.
			return;
		}

		sortInptPrfmncList.push({
    		fcltCd: fcltCd,
    		pltno: pltno,
    		wrhsno: wrhsno,
    		inptYmd: inptYmd,
    		sortCmndno: sortCmndno,
    		sortCmndSn: sortCmndSn,
    		qntt: inptQntt,
    		wght: inptWght
		});

		const sortMng = {
    		apcCd: gv_selectedApcCd,
    		sortInptPrfmncList: sortInptPrfmncList
    	}

    	const postJsonPromise = gfn_postJSON("/am/sort/insertSortInpt.do", sortMng);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_reset();
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

		// grid clear
	   	jsonSortInpt.length = 0;
	   	fn_setGrdSortInpt();
    }

	/**
     * @name fn_setGrdSortInpt
     * @description 선별투입내역 조회
     */
    const fn_setGrdSortInpt = async function() {

		let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");

		const postJsonPromise = gfn_postJSON("/am/sort/selectSortInptList.do", {
			apcCd: gv_selectedApcCd,
			inptYmd: inptYmd,
			sortCmptnYn: 'N',	// 선별미완료
          	// pagination
  	  		pagingYn : 'N'
  			//currentPageNo : pageNo,
   		  	//recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

        try {
        	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonSortInpt.length = 0;
          	data.resultList.forEach((item, index) => {
          		const sortInpt = {
          				apcCd: item.apcCd,
          				wrhsno: item.wrhsno,
          				inptSn: item.inptSn,
          				inptYmd: item.inptYmd,
          				fcltCd: item.fcltCd,
          				qntt: item.qntt,
          				wght: item.wght,
          				sortno: item.sortno,
          				sortCmndno: item.sortCmndno,
          				rmrk: item.rmrk,
          				pltno: item.pltno,
          				wrhsYmd: item.wrhsYmd,
          				prdcrCd: item.prdcrCd,
          				itemCd: item.itemCd,
          				vrtyCd: item.vrtyCd,
          				gdsSeCd: item.gdsSeCd,
          				wrhsSeCd: item.wrhsSeCd,
          				warehouseSeCd: item.warehouseSeCd,
          				bxKnd: item.bxKnd,
          				grdCd: item.grdCd,
          				prdcrNm: item.prdcrNm,
          				itemNm: item.itemNm,
          				vrtyNm: item.vrtyNm,
          				grdNm: item.grdNm,
          				fcltNm: item.fcltNm,
          				warehouseSeNm: item.warehouseSeNm,
          				gdsSeNm: item.gdsSeNm,
          				wrhsSeNm: item.wrhsSeNm,
          				vrtyNm: item.vrtyNm
  				}

          		jsonSortInpt.push(sortInpt);
  			});
          	totalRecordCount = jsonSortInpt.length;
          	document.querySelector('#cnt-inpt').innerText = totalRecordCount;
          	SBUxMethod.set("crtr-ymd", inptYmd);
        } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
        }

		grdSortInpt.refresh();
    }

	/**
     * @name fn_onChangeInptQntt
     * @description 투입 수량 변경 시 event
	 */
    const fn_onChangeInptQntt = function() {

		let inptQntt = parseInt(SBUxMethod.get("dtl-inp-inptQntt")) || 0;

		let invntrQntt = parseInt(SBUxMethod.get("dtl-inp-invntrQntt")) || 0;
		let invntrWght = parseInt(SBUxMethod.get("dtl-inp-invntrWght")) || 0;

		if (invntrQntt <= 0) {
			return;
		}

		if (inptQntt == invntrQntt) {
			SBUxMethod.set("dtl-inp-inptWght", invntrWght);
		} else if (inptQntt < invntrQntt) {
			let inptWght = gfn_apcEstmtWght(invntrWght / invntrQntt * inptQntt, gv_selectedApcCd);
			SBUxMethod.set("dtl-inp-inptWght", inptWght);
		}

    }

	/**
     * @name fn_choiceRawMtrInvntr
     * @description 원물재고 popup
	 */
	const fn_choiceRawMtrInvntr = function() {

		SBUxMethod.openModal('modal-rawMtrInvntr');
		popRawMtrInvntr.init({
				apcCd: gv_selectedApcCd,
				apcNm: gv_selectedApcNm
			}, fn_setRawMtrInvntr);
	}

	/**
     * @name fn_choiceRawMtrInvntr
     * @description 원물재고 popup
	 */
	const fn_setRawMtrInvntr = function(_rawMtrInvntr) {

		if (gfn_isEmpty(_rawMtrInvntr)) {
			return;
		}

		SBUxMethod.set("dtl-inp-pltno", _rawMtrInvntr.pltno);
		SBUxMethod.attr("dtl-inp-pltno", "readonly", "true");

		SBUxMethod.set("dtl-inp-wrhsno", _rawMtrInvntr.wrhsno);
		SBUxMethod.set("dtl-inp-invntrQntt", _rawMtrInvntr.invntrQntt);
		SBUxMethod.set("dtl-inp-invntrWght", _rawMtrInvntr.invntrWght);
		SBUxMethod.set("dtl-lbl-invntr", _rawMtrInvntr.invntr);
		SBUxMethod.set("dtl-inp-sortCmndno", _rawMtrInvntr.sortCmndno);
		SBUxMethod.set("dtl-inp-itemCd", _rawMtrInvntr.itemCd);
		SBUxMethod.set("dtl-inp-itemNm", _rawMtrInvntr.itemNm);
		SBUxMethod.set("dtl-inp-vrtyCd", _rawMtrInvntr.vrtyCd);
		SBUxMethod.set("dtl-inp-vrtyNm", _rawMtrInvntr.vrtyNm);
		SBUxMethod.set("dtl-inp-prdcrCd", _rawMtrInvntr.prdcrCd);
		SBUxMethod.set("dtl-inp-prdcrNm", _rawMtrInvntr.prdcrNm);
		SBUxMethod.set("dtl-lbl-wrhsYmd", _rawMtrInvntr.wrhsYmd);
		SBUxMethod.set("dtl-lbl-warehouseSeNm", _rawMtrInvntr.warehouseSeNm);
		SBUxMethod.set("dtl-lbl-bxKndNm", _rawMtrInvntr.bxKndNm);

		let invntrInfo = " ";
		invntrInfo += "수량: " + _rawMtrInvntr.invntrQntt
				+ " 중량: " + _rawMtrInvntr.invntrWght + " kg "
				+ " 등급: " + _rawMtrInvntr.grdNm;
		SBUxMethod.set("dtl-lbl-invntr", invntrInfo);
	}

	// 선별지시번호 선택 팝업 호출
	const fn_choiceSortCmnd = function() {
		popSortCmndno.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortCmnd);
	}

	const fn_setSortCmnd = function(sortCmnd) {
		if (!gfn_isEmpty(sortCmnd)) {
			SBUxMethod.set('dtl-inp-sortCmndno', sortCmnd.sortCmndno);
			SBUxMethod.set('dtl-inp-sortCmndSn', sortCmnd.sortCmndSn);
			SBUxMethod.set('dtl-inp-sortCmndnoIndct', sortCmnd.sortCmndnoIndct);
			SBUxMethod.set('dtl-inp-inptQntt', sortCmnd.cmndQntt);
			SBUxMethod.set('dtl-inp-inptWght', sortCmnd.cmndWght);
			SBUxMethod.attr("dtl-inp-sortCmndnoIndct", "readonly", "true");


			SBUxMethod.set("dtl-inp-pltno", sortCmnd.pltno);
			SBUxMethod.attr("dtl-inp-pltno", "readonly", "true");

			SBUxMethod.set("dtl-inp-wrhsno", sortCmnd.wrhsno);
			SBUxMethod.set("dtl-inp-invntrQntt", sortCmnd.invntrQntt);
			SBUxMethod.set("dtl-inp-invntrWght", sortCmnd.invntrWght);
			SBUxMethod.set("dtl-lbl-invntr", sortCmnd.invntr);
			SBUxMethod.set("dtl-inp-itemCd", sortCmnd.itemCd);
			SBUxMethod.set("dtl-inp-itemNm", sortCmnd.itemNm);
			SBUxMethod.set("dtl-inp-vrtyCd", sortCmnd.vrtyCd);
			SBUxMethod.set("dtl-inp-vrtyNm", sortCmnd.vrtyNm);
			SBUxMethod.set("dtl-inp-prdcrCd", sortCmnd.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", sortCmnd.prdcrNm);
			SBUxMethod.set("dtl-lbl-wrhsYmd", sortCmnd.wrhsYmd);
			SBUxMethod.set("dtl-lbl-warehouseSeNm", sortCmnd.warehouseSeNm);
			SBUxMethod.set("dtl-lbl-bxKndNm", sortCmnd.bxKndNm);

			let invntrInfo = " ";
			invntrInfo += "수량: " + sortCmnd.invntrQntt
					+ " 중량: " + sortCmnd.invntrWght + " kg "
					+ " 등급: " + sortCmnd.grdNm;
			SBUxMethod.set("dtl-lbl-invntr", invntrInfo);
		}
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>