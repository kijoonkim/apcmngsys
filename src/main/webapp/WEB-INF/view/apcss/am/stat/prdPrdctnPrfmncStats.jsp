<%
 /**
  * @Class Name : prdSpmtPrfmncStats.jsp
  * @Description : 기간별 출하실적 조회
  * @author SI개발부
  * @since 2024.10.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.23   	박승진			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 기간별 출하실적통계 조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	<style>
		#dtl-dtp-crtrYmd > span.sbux-pik-wrap{
			display: flex;
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 기간별 출하실적통계 조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDoc"
						name="btnDoc"
						uitype="normal"
						text="리포트"
						class="btn btn-sm btn-success"
						onclick="fn_doc"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
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
							<th scope="row" class="th_bg">기준일자</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
                                    id="dtl-dtp-crtrYmd"
                                    name="dtl-dtp-crtrYmd"
                                    uitype="range"
                                    date-format="yyyy/mm/dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast"
									onchange="fn_dtpChange(dtl-dtp-crtrYmd)"
									group-id="group1">
                               	</sbux-datepicker>
							</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
										unselected-text="전체"
										uitype="single"
										id="srch-slt-itemCd"
										name="srch-slt-itemCd"
										class="form-control input-sm input-sm-ast"
										jsondata-ref="jsonApcItem"
										onchange="fn_onChangeSrchItemCd(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
										unselected-text="전체"
										uitype="single"
										id="srch-slt-vrtyCd"
										name="srch-slt-vrtyCd"
										class="form-control input-sm input-sm-ast"
										jsondata-ref="jsonApcVrty"
										jsondata-value="itemVrtyCd"
										filter-source-name="srch-slt-itemCd"
										jsondata-filter="itemCd"
										onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="display: flex; flex-direction: row; gap: 10px">
				 <div style="flex: 3">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>품목별 출하량</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-grdRawMtrInvntrStat" style="height:60vh;"></div>
                </div>
                 <div style="flex: 7">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>출하 상세</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-grdRawMtrInvntrStatDtl" style="height:60vh;"></div>
                </div>
				</div>

			</div>
		</div>
	</section>

</body>
<script type="text/javascript">



	const fn_initSBSelect = async function() {
		let result = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, 	gv_apcCd),			// APC 품종(저장)
        ]);
		let x = gfn_dateFirstYmd(new Date());
		let y = gfn_dateLastYmd(new Date());
		SBUxMethod.set('dtl-dtp-crtrYmd', x + ',' + y);
	}




    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
    	fn_createRawMtrInvntrStat();
    	fn_createRawMtrInvntrStatDtl();
    }





	//품목
	var jsonApcItem = [];

	//품종
	var jsonApcVrty = [];

	//기간 저장용
	var dateSaveList = [];

	//통계기간상세
	var jsonStatCrtrDtlTermList = [];

	//통계기간상세
	var jsonStatCrtrDtlElmtList = [];

	//기간
	var jsonTermKnd = [];

    // grid
    // 원물재고통계 현황
    var grdRawMtrInvntrStat;
    var jsonRawMtrInvntrStat = [];

    // grid
    // 원물재고통계 현황
    var grdRawMtrInvntrStatDtl;
    var jsonRawMtrInvntrStatDtl = [];



    const fn_createRawMtrInvntrStat = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrInvntrStat';
	    SBGridProperties.id = 'grdRawMtrInvntrStat';
	    SBGridProperties.jsonref = 'jsonRawMtrInvntrStat';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'byrow';

        SBGridProperties.columns = [
        	{caption: ["품목"],  ref: 'ITEM_NM', type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["품종"],  ref: 'VRTY_NM', type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["수량"],  ref: 'QNTT', type:'output', width:'120px',  style:'text-align:center',format : {type:'number', rule:'#,###'}},
            {caption: ["중량"],  ref: 'WGHT', type:'output', width:'120px',  style:'text-align:center',format : {type:'number', rule:'#,###'}}
        ];

        grdRawMtrInvntrStat = _SBGrid.create(SBGridProperties);
    }

    const fn_createRawMtrInvntrStatDtl = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrInvntrStatDtl';
	    SBGridProperties.id = 'grdRawMtrInvntrStatDtl';
	    SBGridProperties.jsonref = 'jsonRawMtrInvntrStatDtl';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;

        SBGridProperties.columns = [
        	{caption: ["품목"],  ref: 'ITEM_NM', type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["품종"],  ref: 'VRTY_NM', type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["규격"],  ref: 'SPCFCT_NM', type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["등급"],  ref: 'GRD_NM', type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["수량"],  ref: 'QNTT', type:'output', width:'120px',  style:'text-align:center',format : {type:'number', rule:'#,###'}},
            {caption: ["중량"],  ref: 'WGHT', type:'output', width:'120px',  style:'text-align:center',format : {type:'number', rule:'#,###'}}
        ];

        grdRawMtrInvntrStatDtl = _SBGrid.create(SBGridProperties);
    }

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let crtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
		if(crtrYmd === "undefined"){
			return;
		}
		if(crtrYmd[0] === "undefined"){
			return;
		}
		if(crtrYmd[1] === "undefined"){
			return;
		}

		 const postJsonPromise = gfn_postJSON("/am/stat/selectPrdPrdctnPrfmncInfo.do", {
			 apcCd: gv_selectedApcCd
				, itemCd : itemCd
				, vrtyCd : vrtyCd
				, crtrYmdFrom : crtrYmd[0]
		 		, crtrYmdTo :crtrYmd[1]
  		});

        const data = await postJsonPromise;

  		try {
 			if (_.isEqual("S", data.resultStatus)) {

 	      		jsonRawMtrInvntrStat.length = 0;
 	      		jsonRawMtrInvntrStat = data.resultList;
	  	        grdRawMtrInvntrStat.rebuild();
	  	      	await fn_searchDtl();
 			 }
  		}
 		catch (e) {
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
    const fn_searchDtl = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let crtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
		if(crtrYmd === "undefined"){
			return;
		}
		if(crtrYmd[0] === "undefined"){
			return;
		}
		if(crtrYmd[1] === "undefined"){
			return;
		}

		 const postJsonPromise = gfn_postJSON("/am/stat/selectPrdPrdctnPrfmncInfoDtl.do", {
			 apcCd: gv_selectedApcCd
				, itemCd : itemCd
				, vrtyCd : vrtyCd
				, crtrYmdFrom : crtrYmd[0]
		 		, crtrYmdTo :crtrYmd[1]
  		});

        const data = await postJsonPromise;

  		try {
 			if (_.isEqual("S", data.resultStatus)) {

 	      		jsonRawMtrInvntrStatDtl.length = 0;
 	      		jsonRawMtrInvntrStatDtl = data.resultList;
	  	        grdRawMtrInvntrStatDtl.rebuild();

 			 }
  		}
 		catch (e) {
 	            if (!(e instanceof Error)) {
 	                e = new Error(e);
 	            }
 	            console.error("failed", e.message);
 	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
 	    }
	}




    /**
	 * @name fn_doc
	 * @description 리포트 발행
	 */
	const fn_doc = async function() {
		//기준일자
		const crtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd") || '';
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd") || '';
		vrtyCd = vrtyCd.substring(4);

		let conn = {
			apcCd : gv_apcCd
			, ymdFrom : crtrYmd[0]
			, ymdTo : crtrYmd[1]
			, itemCd : itemCd
			, vrtyCd : vrtyCd
		}

		gfn_popClipReport("기간별 생산실적 조회", "am/prdPrdctnPrfmncTot.crf", conn);
 	}












</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>