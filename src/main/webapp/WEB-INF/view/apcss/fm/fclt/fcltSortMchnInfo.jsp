<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<h3 class="box-title" style="line-height: 30px;"> ▶ 선별기운영</h3>
			</div>
			<div style="margin-left: auto;">
				<!--
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				 -->
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 6%">
					<col style="width: 10%">
					<col style="width: 6%">
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 58%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg" scope="row">대상연도</th>
						<td class="td_input"   style="border-right: hidden;">
							<sbux-input id="srch-input-trgtYr" name="srch-input-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td style="border-right:hidden;">
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:150px;"></div>
				</div>
			<br>
					<div><label>선별기현황 상세내역</label></div>

							<div>

			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 17%">
					<col style="width: 17%">
					<col style="width: 17%">
					<col style="width: 17%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg">선별기</th>
						<th class="th_bg">보유현황</th>
						<th class="th_bg">처리능력(톤)</th>
						<th class="th_bg">처리물량(톤)</th>
						<th class="th_bg">연간가동시간(시간)</th>
						<th class="th_bg">평균가동일수<br>
							*연간가동시간/4시간<br>
						</th>
					</tr>
					<tr>

						<th class="th_bg">품목1</th>
						<td class="td_input">
							<sbux-select id="dtl-input-sortMchnHldYn1" name="dtl-input-sortMchnHldYn1"
								uitype="single"
								filtering="true"
								jsondata-ref="selectYnData"
								unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcCap1" name="dtl-input-prcCap1" uitype="text" class="form-control input-sm" placeholder="35  1일(8h)처리능력" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcVol1" name="dtl-input-prcVol1" uitype="text" class="form-control input-sm" placeholder="2,200 연간처리실적" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-annOperTime1" name="dtl-input-annOperTime1" uitype="text" class="form-control input-sm" placeholder="440" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-avgOperDay" name="dtl-input-avgOperDay" uitype="text" class="form-control input-sm" placeholder="110" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">품목2</th>
						<td class="td_input">
							<sbux-select id="dtl-input-sortMchnHldYn2" name="dtl-input-sortMchnHldYn2"
								uitype="single"
								filtering="true"
								jsondata-ref="selectYnData"
								unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcCap2" name="dtl-input-prcCap2" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcVol2" name="dtl-input-prcVol2" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-annOperTime2" name="dtl-input-annOperTime2" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-avgOperDay2" name="dtl-input-avgOperDay2" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">품목3</th>
						<td class="td_input">
							<sbux-select id="dtl-input-sortMchnHldYn3" name="dtl-input-sortMchnHldYn3"
								uitype="single"
								filtering="true"
								jsondata-ref="selectYnData"
								unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcCap3" name="dtl-input-prcCap3" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcVol3" name="dtl-input-prcVol3" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-annOperTime3" name="dtl-input-annOperTime3" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-avgOperDay3" name="dtl-input-avgOperDay3" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">기타</th>
						<td class="td_input">
							<sbux-select id="dtl-input-sortMchnHldYn4" name="dtl-input-sortMchnHldYn4"
								uitype="single"
								filtering="true"
								jsondata-ref="selectYnData"
								unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcCap4" name="dtl-input-prcCap4" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-prcVol4" name="dtl-input-prcVol4" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-annOperTime4" name="dtl-input-annOperTime4" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-avgOperDay4" name="dtl-input-avgOperDay4" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">대상연도</th>
						<td class="td_input" colspan="1">
							<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="4" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th class="th_bg">apc명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="4"  style="border-left: hidden;"></td>
					</tr>

				</tbody>
			</table>
			</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>

    <!-- apc 선택 Modal -->
    <div>
        <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-apcSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
    </div>
</body>

<script type="text/javascript">

	let date = new Date();
	let year  = date.getFullYear();
    //화면 초기 로딩
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);
    	fn_createGrid();//그리드 생성 설정 함수

    });

    //grid 초기화
    var grdStMcInfList; // 그리드를 담기위한 객체 선언
    var jsonStMcInfList = []; // 그리드의 참조 데이터 주소 선언

	var selectYnData = [
		{'text': 'Y','label': 'Y', 'value': '1'},
		{'text': 'N','label': 'N', 'value': '2'}
	]
	var comboYnData = [
		{'label': 'Y', 'value': '1'},
		{'label': 'N', 'value': '2'}
	]

    //그리드 생성 설정
    function fn_createGrid() {
     	console.log("******************fn_createGrid**********************************");
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdStMcInfList';
	    SBGridProperties.jsonref = 'jsonStMcInfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["APCNM"],		ref: 'apcNm',            		type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["선별기 보유 유무","품목1"],	ref: 'sortMchnHldYn1',    		type:'combo',  width:'6%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["선별기 보유 유무","품목2"],	ref: 'sortMchnHldYn2',    		type:'combo',  width:'6%',    style:'text-align:center'
                ,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["선별기 보유 유무","품목3"],	ref: 'sortMchnHldYn3',    		type:'combo',  width:'6%',    style:'text-align:center'
                ,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["선별기 보유 유무","기타품목"],	ref: 'sortMchnHldYn4',    		type:'combo',  width:'6%',    style:'text-align:center'
                ,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},

            {caption: ["처리능력(톤)","품목1"],		ref: 'prcCap1',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["처리능력(톤)","품목2"],		ref: 'prcCap2',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["처리능력(톤)","품목3"],		ref: 'prcCap3',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["처리능력(톤)","기타품목"],		ref: 'prcCap4',       type:'output',  width:'6%',    style:'text-align:center'},

            {caption: ["처리물량(톤)","품목1"],		ref: 'prcVol1',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["처리물량(톤)","품목2"],		ref: 'prcVol2',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["처리물량(톤)","품목3"],		ref: 'prcVol3',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["처리물량(톤)","기타품목"],		ref: 'prcVol4',       type:'output',  width:'6%',    style:'text-align:center'},

            {caption: ["연간가동시간(시간)","품목1"],		ref: 'annOperTime1',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["연간가동시간(시간)","품목2"],		ref: 'annOperTime2',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["연간가동시간(시간)","품목3"],		ref: 'annOperTime3',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["연간가동시간(시간)","기타품목"],		ref: 'annOperTime4',       type:'output',  width:'6%',    style:'text-align:center'},

            {caption: ["평균가동일수","품목1"],		ref: 'avgOperDay1',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["평균가동일수","품목2"],		ref: 'avgOperDay2',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["평균가동일수","품목3"],		ref: 'avgOperDay3',       type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["평균가동일수","기타품목"],		ref: 'avgOperDay4',       type:'output',  width:'6%',    style:'text-align:center'},

            {caption: ["APCCD"],		ref: 'apcCd',            		type:'output',  hidden: true},
            {caption: ["대상연도"],			ref: 'trgtYr',      		    type:'output',  hidden: true}

        ];
        grdStMcInfList = _SBGrid.create(SBGridProperties);
        grdStMcInfList.bind('click', 'fn_view');
        grdStMcInfList.bind('beforepagechanged', 'fn_pagingStMcInfList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdStMcInfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	fn_setGrdStMcInfList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingStMcInfList = async function() {
    	console.log("******************fn_pagingStMcInfList**********************************");
    	let recordCountPerPage = grdStMcInfList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdStMcInfList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdStMcInfList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_setGrdStMcInfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdStMcInfList**********************************");
    	// form clear
    	fn_clearForm();

		grdStMcInfList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

        //비동기 포스트타입 url 데이터연결 페이징처리 글로벌
        //gfn_postJSON 는 ajax고 post통신의 데이터를 json 타입으로 보내는것이다
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltSortMchnInfoList.do", {
			apcCd: apcCd,
        	trgtYr: trgtYr,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
        });

        const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonStMcInfList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
			  		trgtYr: item.trgtYr	 	//대상연도
				   	, apcCd: item.apcCd  	//APC
				   	, apcNm: item.apcNm  	//APC명
					, sortMchnHldYn1: item.sortMchnHldYn1 //선별기 보유 유무
					, sortMchnHldYn2: item.sortMchnHldYn2 //선별기 보유 유무
					, sortMchnHldYn3: item.sortMchnHldYn3 //선별기 보유 유무
					, sortMchnHldYn4: item.sortMchnHldYn4 //선별기 보유 유무

					, prcCap1: item.prcCap1 //처리능력(톤)
					, prcCap2: item.prcCap2 //처리능력(톤)
					, prcCap3: item.prcCap3 //처리능력(톤)
					, prcCap4: item.prcCap4 //처리능력(톤)

					, prcVol1: item.prcVol1  //처리물량(톤)
					, prcVol2: item.prcVol2  //처리물량(톤)
					, prcVol3: item.prcVol3  //처리물량(톤)
					, prcVol4: item.prcVol4  //처리물량(톤)

					, annOperTime1: item.annOperTime1  //연간가동시간(시간)
					, annOperTime2: item.annOperTime2  //연간가동시간(시간)
					, annOperTime3: item.annOperTime3  //연간가동시간(시간)
					, annOperTime4: item.annOperTime4  //연간가동시간(시간)

					, avgOperDay1: item.avgOperDay1  //평균가동일수
					, avgOperDay2: item.avgOperDay2  //평균가동일수
					, avgOperDay3: item.avgOperDay3  //평균가동일수
					, avgOperDay4: item.avgOperDay4  //평균가동일수

				}

				jsonStMcInfList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	console.log("totalRecordCount*************", totalRecordCount);

        	if (jsonStMcInfList.length > 0) {

        		if(grdStMcInfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdStMcInfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdStMcInfList.rebuild();
				}else{
					grdStMcInfList.refresh()
				}
        	} else {
        		grdStMcInfList.setPageTotalCount(totalRecordCount);
        		grdStMcInfList.rebuild();
        	}

        	document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		//console.error("failed", e.message);
        }
    }



    //신규 작성 dtl 내부의 값을 null로
    function fn_create() {
    	console.log("******************fn_create**********************************");
   	    SBUxMethod.set("dtl-input-trgtYr", null);  //대상연도
   	    SBUxMethod.set("dtl-input-apcCd", null);  //APC
   	 	SBUxMethod.set("dtl-input-apcNm", null);  //APC명
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn1", null);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn2", null);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn3", null);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn4", null);  //선별기 보유 유무

   	 	SBUxMethod.set("dtl-input-prcCap1", null);  //처리능력
   	 	SBUxMethod.set("dtl-input-prcCap2", null);  //처리능력
   		SBUxMethod.set("dtl-input-prcCap3", null);  //처리능력
   		SBUxMethod.set("dtl-input-prcCap4", null);  //처리능력

   		SBUxMethod.set("dtl-input-prcVol1", null);  //처리물량
   		SBUxMethod.set("dtl-input-prcVol2", null);  //처리물량
   		SBUxMethod.set("dtl-input-prcVol3", null);  //처리물량
   		SBUxMethod.set("dtl-input-prcVol4", null);  //처리물량

   		SBUxMethod.set("dtl-input-annOperTime1", null);  //연간가동시간
   		SBUxMethod.set("dtl-input-annOperTime2", null);  //연간가동시간
   		SBUxMethod.set("dtl-input-annOperTime3", null);  //연간가동시간
   		SBUxMethod.set("dtl-input-annOperTime4", null);  //연간가동시간

   		SBUxMethod.set("dtl-input-avgOperDay1", null);  //평균가동일수
   		SBUxMethod.set("dtl-input-avgOperDay2", null);  //평균가동일수
   		SBUxMethod.set("dtl-input-avgOperDay3", null);  //평균가동일수
   		SBUxMethod.set("dtl-input-avgOperDay4", null);  //평균가동일수
    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
    	    SBUxMethod.set("dtl-input-trgtYr", null);  //대상연도
       	    SBUxMethod.set("dtl-input-apcCd", null);  //APC
       	 	SBUxMethod.set("dtl-input-apcNm", null);  //APC명
       	 	SBUxMethod.set("dtl-input-sortMchnHldYn1", null);  //선별기 보유 유무
       	 	SBUxMethod.set("dtl-input-sortMchnHldYn2", null);  //선별기 보유 유무
       	 	SBUxMethod.set("dtl-input-sortMchnHldYn3", null);  //선별기 보유 유무
       	 	SBUxMethod.set("dtl-input-sortMchnHldYn4", null);  //선별기 보유 유무

       	 	SBUxMethod.set("dtl-input-prcCap1", null);  //처리능력
       	 	SBUxMethod.set("dtl-input-prcCap2", null);  //처리능력
       		SBUxMethod.set("dtl-input-prcCap3", null);  //처리능력
       		SBUxMethod.set("dtl-input-prcCap4", null);  //처리능력

       		SBUxMethod.set("dtl-input-prcVol1", null);  //처리물량
       		SBUxMethod.set("dtl-input-prcVol2", null);  //처리물량
       		SBUxMethod.set("dtl-input-prcVol3", null);  //처리물량
       		SBUxMethod.set("dtl-input-prcVol4", null);  //처리물량

       		SBUxMethod.set("dtl-input-annOperTime1", null);  //연간가동시간
       		SBUxMethod.set("dtl-input-annOperTime2", null);  //연간가동시간
       		SBUxMethod.set("dtl-input-annOperTime3", null);  //연간가동시간
       		SBUxMethod.set("dtl-input-annOperTime4", null);  //연간가동시간

       		SBUxMethod.set("dtl-input-avgOperDay1", null);  //평균가동일수
       		SBUxMethod.set("dtl-input-avgOperDay2", null);  //평균가동일수
       		SBUxMethod.set("dtl-input-avgOperDay3", null);  //평균가동일수
       		SBUxMethod.set("dtl-input-avgOperDay4", null);  //평균가동일수
     }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");
		/*
    	if (!SBUxMethod.get("gsb-slt-apcCd")) {
            alert("조회 항목의 APC 코드를 선택하세요.");
            return;
        }

    	if (!SBUxMethod.get("srch-input-trgtYr")) {
            alert("조회 항목의 대상년도를 선택하세요.");
            return;
        }
    	*/

    	if (gfn_isEmpty(trgtYr)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     * 신규 등록
     */
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltSortMchnInfo.do", {
	   		trgtYr: SBUxMethod.get('dtl-input-trgtYr')                 			//대상연도
   	        ,apcCd: SBUxMethod.get('dtl-input-apcCd')               			    //apc코드
			,sortMchnHldYn1 :SBUxMethod.get('dtl-input-sortMchnHldYn1')   //선별기 보유 유무
			,sortMchnHldYn2 :SBUxMethod.get('dtl-input-sortMchnHldYn2')   //선별기 보유 유무
			,sortMchnHldYn3 :SBUxMethod.get('dtl-input-sortMchnHldYn3')   //선별기 보유 유무
			,sortMchnHldYn4 :SBUxMethod.get('dtl-input-sortMchnHldYn4')   //선별기 보유 유무

			,prcCap1 :SBUxMethod.get('dtl-input-prcCap1')   //처리능력
			,prcCap2 :SBUxMethod.get('dtl-input-prcCap2')   //처리능력
			,prcCap3 :SBUxMethod.get('dtl-input-prcCap3')   //처리능력
			,prcCap4 :SBUxMethod.get('dtl-input-prcCap4')   //처리능력

			,prcVol1 :SBUxMethod.get('dtl-input-prcVol1')   //처리물량
			,prcVol2 :SBUxMethod.get('dtl-input-prcVol2')   //처리물량
			,prcVol3 :SBUxMethod.get('dtl-input-prcVol3')   //처리물량
			,prcVol4 :SBUxMethod.get('dtl-input-prcVol4')   //처리물량

			,annOperTime1 :SBUxMethod.get('dtl-input-annOperTime1')   //연간가동시간
			,annOperTime2 :SBUxMethod.get('dtl-input-annOperTime2')   //연간가동시간
			,annOperTime3 :SBUxMethod.get('dtl-input-annOperTime3')   //연간가동시간
			,annOperTime4 :SBUxMethod.get('dtl-input-annOperTime4')   //연간가동시간

			,avgOperDay1 :SBUxMethod.get('dtl-input-avgOperDay1')   //평균가동일수
			,avgOperDay2 :SBUxMethod.get('dtl-input-avgOperDay2')   //평균가동일수
			,avgOperDay3 :SBUxMethod.get('dtl-input-avgOperDay3')   //평균가동일수
			,avgOperDay4 :SBUxMethod.get('dtl-input-avgOperDay4')   //평균가동일수


		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
        // 결과 확인 후 재조회
        console.log("insert result", data);
    }
	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){
    	 console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltSortMchnInfo.do", {
		   		trgtYr: SBUxMethod.get('dtl-input-trgtYr')                 		//대상연도
	   	        ,apcCd: SBUxMethod.get('dtl-input-apcCd')               		//apc코드
				,sortMchnHldYn1 :SBUxMethod.get('dtl-input-sortMchnHldYn1')   //선별기 보유 유무
				,sortMchnHldYn2 :SBUxMethod.get('dtl-input-sortMchnHldYn2')   //선별기 보유 유무
				,sortMchnHldYn3 :SBUxMethod.get('dtl-input-sortMchnHldYn3')   //선별기 보유 유무
				,sortMchnHldYn4 :SBUxMethod.get('dtl-input-sortMchnHldYn4')   //선별기 보유 유무

				,prcCap1 :SBUxMethod.get('dtl-input-prcCap1')   //처리능력
				,prcCap2 :SBUxMethod.get('dtl-input-prcCap2')   //처리능력
				,prcCap3 :SBUxMethod.get('dtl-input-prcCap3')   //처리능력
				,prcCap4 :SBUxMethod.get('dtl-input-prcCap4')   //처리능력

				,prcVol1 :SBUxMethod.get('dtl-input-prcVol1')   //처리물량
				,prcVol2 :SBUxMethod.get('dtl-input-prcVol2')   //처리물량
				,prcVol3 :SBUxMethod.get('dtl-input-prcVol3')   //처리물량
				,prcVol4 :SBUxMethod.get('dtl-input-prcVol4')   //처리물량

				,annOperTime1 :SBUxMethod.get('dtl-input-annOperTime1')   //연간가동시간
				,annOperTime2 :SBUxMethod.get('dtl-input-annOperTime2')   //연간가동시간
				,annOperTime3 :SBUxMethod.get('dtl-input-annOperTime3')   //연간가동시간
				,annOperTime4 :SBUxMethod.get('dtl-input-annOperTime4')   //연간가동시간

				,avgOperDay1 :SBUxMethod.get('dtl-input-avgOperDay1')   //평균가동일수
				,avgOperDay2 :SBUxMethod.get('dtl-input-avgOperDay2')   //평균가동일수
				,avgOperDay3 :SBUxMethod.get('dtl-input-avgOperDay3')   //평균가동일수
				,avgOperDay4 :SBUxMethod.get('dtl-input-avgOperDay4')   //평균가동일수
    		});

        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }

        // 결과 확인 후 재조회
        console.log("update result", data);
    }


    //선택 삭제
    function fn_delete() {
    	console.log("******************fn_delete**********************************");
    	/**
         * @type {any[]}
         */
        let list = [];

        /**
         * @type {any[]}
         */
        const rows = grdStMcInfList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });

        if (list.length == 0) {
        	alert("삭제할 대상이 없습니다.");
        	return;
        }

        fn_subDelete(confirm("삭제 하시겠습니까?"), list);

        /*
        for ( let i = 0; i < gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].msgKey);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg;
        if (delList.length == 1) {
            delMsg = delList[0];
        }
        else {
            delMsg = delList.length + "건";
        }
        delMsg += "을 삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delKey=" + delList.join(",");
            console.log("data ::::: " + params);
        }
        */
    }

	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){
     	console.log("******************fn_subDelete**********************************");
 		if (!isConfirmed) return;

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltSortMchnInfo.do", list);

         const data = await postJsonPromise;
		//예외처리
         try {
         	if (_.isEqual("S", data.resultStatus)) {
         		alert("처리 되었습니다.");
         		fn_search();
         	} else {
         		alert(data.resultMessage);
         	}
         } catch(e) {
         }

         // 결과 확인 후 재조회
         console.log("update result", data);
    }

    //상세정보 보기 클릭이벤트
    function fn_view() {
    	console.log("******************fn_view**********************************");
    	var nCol = grdStMcInfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdStMcInfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdStMcInfList.getRowData(nRow);
        rowData = fn_emptyString(rowData);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);  //대상연도
   	    SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);  //APC
   	 	SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);  //APC명

   	 	SBUxMethod.set("dtl-input-sortMchnHldYn1", null);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn1", rowData.sortMchnHldYn1);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn2", null);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn2", rowData.sortMchnHldYn2);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn3", null);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn3", rowData.sortMchnHldYn3);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn4", null);  //선별기 보유 유무
   	 	SBUxMethod.set("dtl-input-sortMchnHldYn4", rowData.sortMchnHldYn4);  //선별기 보유 유무

   	 	SBUxMethod.set("dtl-input-prcCap1", rowData.prcCap1);  //처리능력
   	 	SBUxMethod.set("dtl-input-prcCap2", rowData.prcCap2);  //처리능력
   		SBUxMethod.set("dtl-input-prcCap3", rowData.prcCap3);  //처리능력
   		SBUxMethod.set("dtl-input-prcCap4", rowData.prcCap4);  //처리능력

   		SBUxMethod.set("dtl-input-prcVol1", rowData.prcVol1);  //처리물량
   		SBUxMethod.set("dtl-input-prcVol2", rowData.prcVol2);  //처리물량
   		SBUxMethod.set("dtl-input-prcVol3", rowData.prcVol3);  //처리물량
   		SBUxMethod.set("dtl-input-prcVol4", rowData.prcVol4);  //처리물량

   		SBUxMethod.set("dtl-input-annOperTime1", rowData.annOperTime1);  //연간가동시간
   		SBUxMethod.set("dtl-input-annOperTime2", rowData.annOperTime2);  //연간가동시간
   		SBUxMethod.set("dtl-input-annOperTime3", rowData.annOperTime3);  //연간가동시간
   		SBUxMethod.set("dtl-input-annOperTime4", rowData.annOperTime4);  //연간가동시간

   		SBUxMethod.set("dtl-input-avgOperDay1", rowData.avgOperDay1);  //평균가동일수
   		SBUxMethod.set("dtl-input-avgOperDay2", rowData.avgOperDay2);  //평균가동일수
   		SBUxMethod.set("dtl-input-avgOperDay3", rowData.avgOperDay3);  //평균가동일수
   		SBUxMethod.set("dtl-input-avgOperDay4", rowData.avgOperDay4);  //평균가동일수
    }


    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdStMcInfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdStMcInfList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }

 	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}

	// "null" 로 들어가는 경우 방지
	function fn_emptyString(obj) {
		console.log("==========fn_emptyString=============");
	    if (Array.isArray(obj)) {
	        // 배열의 경우
	        for (var i = 0; i < obj.length; i++) {
	        	if (data[i] === "null" || data[i] === null) {
	                obj[i] = "";
	            }
	        }
	    } else if (typeof obj === "object") {
	        // 객체의 경우
	        for (var key in obj) {
	        	if (obj[key] === "null" || obj[key] === null) {
	                obj[key] = "";
	            }
	        }
	    }
	    return obj;
	}
</script>
</html>