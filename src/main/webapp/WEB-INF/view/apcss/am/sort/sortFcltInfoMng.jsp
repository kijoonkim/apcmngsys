<%
 /**
  * @Class Name : sortFcltInfoMng.jsp
  * @Description : 선별설비정보관리 화면
  * @author SI개발부
  * @since 2024.07.01
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.07.01   	박승진			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 선별설비정보관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별설비정보관리 -->
				</div>
				<div style="margin-left: auto;">


					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelectAll.jsp" %>
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>선별기</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-select
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									id="srch-slt-sortFcltInfo"
									name="srch-slt-sortFcltInfo"
									uitype="single"
									jsondata-ref="jsonSortFcltInfo"
									unselected-text="전체"
								></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">

					<div class="ad_tbl_top"  >
						<ul class="ad_tbl_count">
							<li><span>▶선별기목록</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdSortFcltList" style="width:100%;height:300px;"></div>
					</div>
				</div>

					<div class="row">
						<div class="col-sm-7">
							<div class="ad_tbl_top2">
								<ul class="ad_tbl_count">
									<li><span>▶상세정보</span></li>
								</ul>
							</div>
							<div>
								<table class="table table-bordered tbl_fixed">
									<colgroup>
										<col style="width: 20%">
										<col style="width: 30%">
										<col style="width: 20%">
										<col style="width: 30%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="th_bg">설비코드</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-sortFcltCd" name="dtl-inp-sortFcltCd" uitype="text" class="form-control input-sm"></sbux-input>
											</td>
											<th scope="row" class="th_bg">설비명</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-sortFcltNm" name="dtl-inp-sortFcltNm" uitype="text" class="form-control input-sm" required style="width:100%"  ></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg">설비유형</th>
											<td class="td_input">
												<sbux-select id="dtl-slt-sortFcltType" name="dtl-slt-sortFcltType" class="form-control input-sm" uitype="single" jsondata-ref="jsonSortFcltType" unselected-text="선택" required style="width:100%"></sbux-select>
											</td>
											<th scope="row" class="th_bg">포장구분</th>
											<td class="td_input">
												<sbux-select id="dtl-slt-pckgSeCd" name="dtl-slt-pckgSeCd" class="form-control input-sm" uitype="single" jsondata-ref="jsonPckgSeCd" unselected-text="선택" required style="width:100%"></sbux-select>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg">설명</th>
											<td class="td_input" colspan="3">
												<sbux-input id="dtl-inp-sortFcltExpln" name="dtl-inp-sortFcltExpln" class="form-control input-sm" uitype="text" required style="width:100%" ></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg">대표품목</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-rprsItem" name="dtl-inp-rprsItem" uitype="text" class="form-control input-sm"></sbux-input>
											</td>
											<th scope="row" class="th_bg">대표품종</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-rprsVrty" name="dtl-inp-rprsVrty" uitype="text" class="form-control input-sm" required style="width:100%"  ></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg">선별Capa</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-sortCapa" name="dtl-inp-sortCapa" uitype="text" class="form-control input-sm"></sbux-input>
											</td>
											<th scope="row" class="th_bg">단위</th>
											<td class="td_input">
												<sbux-select id="dtl-slt-unitCd" name="dtl-slt-unitCd" class="form-control input-sm" uitype="single" jsondata-ref="jsonUnitCd" unselected-text="선택" required style="width:100%"></sbux-select>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg">가동시간</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-oprtngHr" name="dtl-inp-oprtngHr" uitype="text" class="form-control input-sm"></sbux-input>
											</td>
											<th scope="row" class="th_bg">비가동시간</th>
											<td class="td_input">
												<sbux-input id="dtl-inp-nOprtngHr" name="dtl-inp-nOprtngHr" uitype="text" class="form-control input-sm" required style="width:100%"  ></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg">비고</th>
											<td colspan="3" class="td_input">
												<sbux-textarea id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="normal" rows="2" class="form-control" ></sbux-input>
											</td>
										</tr>
									</thead>
								</table>
							</div>
						</div>

						<div class="col-sm-5">
							<div class="ad_tbl_top2"  >
								<ul class="ad_tbl_count">
									<li><span>▶상세정보</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdSortFcltDtl" style="width:100%;height:280px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>









	</section>


<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {

	}
	async function cfn_add() {
		await fn_create();
	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}
	let lv_prvAuthrtId = "";
	let lv_prvMenuId = "";

	/* 공통코드 */
	var jsonComSysId 		= [];	// 시스템유형	srch-slt-sysId		SYS_ID
    var jsonComAuthrtType 	= [];	// 권한유형	dtl-slt-authrtType	AUTHRT_TYPE
	var jsonAplcnType		= [];	// 적용유형	APLCN_TYPE

    /* SBGrid */
    var grdSortFcltList;			// 선별기목록
    var grdSortFcltDtl;		// 상세정보


    /* SBGrid Data (JSON) */
    var jsonSortFcltInfo = [];
    var jsonSortFcltType = [];
    var jsonPckgSeCd = [];
    var jsonUnitCd = [];
    var jsonSortDtlType = [];

    var jsonSortFcltList = [];
    var jsonSortFcltDtl = [];

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

    /**
     * @name fn_init
     * @description initialize Form
     * @function
     */
	const fn_init = async function() {

		lv_prvAuthrtId = "";
		lv_prvMenuId = "";

		await fn_initSBSelect();
		//fn_createGrdComAuth();
		fn_createGrdSortFcltList();
		fn_createGrdSortFcltDtl();


	}

    /**
     * @name fn_initSBSelect
     * @description SBSelect 초기화
     * @function
     */
    const fn_initSBSelect = async function() {

    	let rst = await Promise.all([
    		// 조회 SB select
    	 	gfn_setComCdSBSelect('srch-slt-sortFcltInfo', jsonSortFcltInfo, 'SORT_FCLT_CD',gv_selectedApcCd),	// 선별설비정보
    	 	// 상세 SB select
    	 	//gfn_setComCdSBSelect('dtl-slt-authrtType', jsonComAuthrtType, 'AUTHRT_TYPE'),	// 권한유형
    	 	//fn_initComCd();
    	]);

    }



    /**
     * @name fn_createGrdSortFcltList
     * @description 선별기 목록
     * @function
     */
    const fn_createGrdSortFcltList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortFcltList';
	    SBGridProperties.id = 'grdSortFcltList';
	    SBGridProperties.jsonref = 'jsonSortFcltList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"],			ref: 'fcltCd',		type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["명칭"],			ref: 'fcltNm',    	type:'output',  width:'40%',    style:'text-align:left'},
            {caption: ["설명"],			ref: 'fcltExpln',			type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["연계코드"],	ref: 'lnkgCd',    	type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["권한설명"],	ref: 'test',        	type:'output',  hidden: true},

        ];

        grdSortFcltList = _SBGrid.create(SBGridProperties);
        //grdSortFcltList.bind('click', fn_view);
        //grdSortFcltList.bind('beforepagechanged', fn_pagingGrdComAuth);
    }


    /**
     * @name fn_createGrdSortFcltDtl
     * @description 선별기 상세정보
     * @function
     */
    const fn_createGrdSortFcltDtl = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortFcltDtl';
	    SBGridProperties.id = 'grdSortFcltDtl';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.jsonref = 'jsonSortFcltDtl';


        SBGridProperties.columns = [
            {caption: ['상세유형'], ref: 'sortDtlType', width: '40%', type: 'combo', typeinfo : {ref:'jsonSortDtlType', label:'label', value:'value'}},
            {caption: ['상세수치'], ref: 'sortDtlNv', width: '30%', type: 'input'},
            {caption: ['상세코드'], ref: 'sortDtlCd', width: '30%', type: 'input'},

        ];

        grdSortFcltDtl = _SBGrid.create(SBGridProperties);
        //grdSortFcltDtl.bind('click', fn_viewUi);
    }






 	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	fn_setGrdSortFcltList();
    }

    /**
     * @name fn_setGrdSortFcltList
     * @description 선별설비리스트 조회
     * @param
     * @param
     */
    const fn_setGrdSortFcltList = async function() {

		let sortFcltCd = SBUxMethod.get("srch-slt-sortFcltInfo");
		let authrtNm = SBUxMethod.get("srch-inp-authrtNm");
		let apcCd = gv_selectedApcCd;

        const postJsonPromise = gfn_postJSON("/co/cmns/selectCmnsOprtrApcSortFcltList.do",{
            	apcCd: apcCd
            	, fcltCd : sortFcltCd
        });

        const data = await postJsonPromise;

		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonSortFcltList.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					const authrt = {
  						fcltCd: item.fcltCd,
  						fcltNm: item.fcltNm,
  						fcltExpln: item.fcltExpln,
  						lnkgCd: item.lnkgCd
  					}
  					jsonSortFcltList.push(authrt);

  					if (index === 0) {
  						totalRecordCount = item.totalRecordCount;
  					}
  				});
  	        	grdSortFcltList.refresh();
  			}

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }













</script>
</body>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>