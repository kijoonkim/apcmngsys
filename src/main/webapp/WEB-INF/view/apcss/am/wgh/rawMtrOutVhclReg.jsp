<%
    /**
     * @Class Name : rawMtrEntrVhclReg.jsp
     * @Description : 원물 입차등록
     * @author SI개발부
     * @since 2024.09.03
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.09.03   	박승진		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 원물 출차등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>

    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물 입차등록 -->
                </div>
                <div style="margin-left: auto;">

					<sbux-button id="btnNew" name="btnNew" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_new"></sbux-button>
                    <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                    <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>


                </div>
            </div>
            <div class="box-body">
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <div>
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
							<th scope="row" class="th_bg">계량대</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-wghFcltCd"
									name="srch-slt-wghFcltCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonSortFclt"
									style="width:80%"
									 group-id="group1"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg">계량번호</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-wghNo"
									name="srch-inp-wghNo"
									class="form-control input-sm"
									style="width:80%"
									 group-id="group1"
									 readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">계량일자</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-wghYmd"
									name="srch-dtp-wghYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
									 group-id="group1"
								></sbux-datepicker>
							</td>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-vhclNo"
									name="srch-inp-vhclNo"
									class="form-control input-sm"
									style="width:80%"
									 group-id="group1"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">출차중량</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-outVhclWght"
									name="srch-inp-outVhclWght"
									class="form-control input-sm"
									style="width:80%"
									 group-id="group1"
								></sbux-input>
							</td>
							<th scope="row" class="th_bg">출차시각</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">

								<sbux-spinner
									id="srch-dtp-outVhclTm"
									name="srch-dtp-outVhclTm"
									uitype="normal"
									data-type="time"
									time-hours="24hours"
									class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
									 group-id="group1"
								></sbux-spinner>
							</td>
							<th scope="row" class="th_bg">비고</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-rmrk"
									name="srch-inp-rmrk"
									class="form-control input-sm"
									style="width:80%"
									 group-id="group1"
								></sbux-input>
							</td>
						</tr>

						<tr>

						</tr>

					</tbody>
				</table>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>입출차목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdRawMtrWghList" style="height:350px"></div>
                    </div>

                </div>
            </div>
        </div>
        <div id="div-rpt-clipReportPrint" style="display:none;"></div>
    </section>
</body>
<script>
    /** 상단 grid ref Json **/
    /** 하단 grid ref Json **/
    var jsonWghFcltDtlList =[];
    var grdWghFcltDtlList;




    /** 설비유형 select **/
    var Type =[];

    /** 포장구분 select **/
    var jsonPckgSe =[];

    /** 단위 select **/
    var jsonUnit =[];

    /** 대표품목 **/
    var jsonApcItem = [];

    /** 대표품종 **/
    var jsonApcVrty = [];

    var comboData = [{label : 'Y', value : 'Y'},{label : 'N', value : 'N'}];

    /** 선별기 검색조건**/
    var jsonSortFclt = [];

    /** 계량구분코드**/
    var jsonWghSeCd = [];



    const fn_init = async function(){



        let result = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-wghFcltCd',	jsonSortFclt, 	'WGH_FCLT_CD', gv_selectedApcCd), 			// 선별기
			gfn_setComCdSBSelect('grdWghFcltDtlList',	jsonWghSeCd, 	'WGH_SE_CD', '0000')
        ]);

    }

    /** 하단 우측 grid create **/
    const fn_createSortFcltDtlList = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdRawMtrWghList';
        SBGridProperties.id = 'grdWghFcltDtlList';
        SBGridProperties.jsonref = 'jsonWghFcltDtlList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ['계량대'], ref: 'fcltCd', width: '100px', type: 'combo', typeinfo : {ref:'jsonSortFclt', label:'text', value:'value', oneclickedit: true}, style:'text-align:center',disabled : {uihidden : true}},
            {caption: ['차량번호'], ref: 'vhclno', width: '100px', type: 'input', style:'text-align:center'},
            //{caption: ['계량구분'], ref: 'wghSeCd', width: '100px', type: 'combo', typeinfo : {ref:'jsonWghSeCd', label:'text', value:'value', oneclickedit: true} , style:'text-align:center' ,disabled : {uihidden : true}},
            {caption: ['입차시각'], ref: 'entrTm', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['출차시각'], ref: 'outTm', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['입차중량'], ref: 'entrWght', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['출차중량'], ref: 'outWght', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['차이'], ref: 'diff', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['계량번호'], ref: 'wghno', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['처리업무'], ref: 'prcsTaskCd', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['완료일시'], ref: 'prcsCmptnDt', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['비고'], ref: 'rmrk', width: '100px', type: 'input', style:'text-align:center'}
            /* {caption: ['기본창고'], ref: 'warehouseSeCd', width: '100px', type: 'combo', typeinfo : {ref:'jsonWarehouse', label:'text', value:'value', oneclickedit: true}, style:'text-align:center'},
            {caption: ['중량단위'], ref: 'wghtUnit', width: '100px', type: 'input', style:'text-align:center'},
            {caption: ['시작일자'], ref: 'bgngYmd', width: '100px', type : 'datepicker',  format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'}, typeinfo : {oneclickedit: true}, style:'text-align:center'},
            {caption: ['종료일자'], ref: 'endYmd', width: '100px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'},  typeinfo : {oneclickedit: true}, style:'text-align:center'},
            {caption: ['비고'], ref: 'fcltRmrk', width: '100px', type: 'input', style:'text-align:center'} */

        ]
        grdWghFcltDtlList = _SBGrid.create(SBGridProperties);
        grdWghFcltDtlList.bind('click', fn_click);

    }
	const fn_click = async function(){
		let rowIdx = grdWghFcltDtlList.getRow();
		let rowData = grdWghFcltDtlList.getRowData(rowIdx);

		if(gfn_nvl(rowData) === ""){
			return;
		}
		SBUxMethod.set("srch-slt-wghFcltCd",rowData.fcltCd);
		SBUxMethod.set("srch-inp-wghNo",rowData.wghno);
		SBUxMethod.set("srch-inp-vhclNo",rowData.vhclno);
		SBUxMethod.set("srch-inp-outVhclWght",rowData.outWght); //입차중량
		const timePart = rowData.outTm.slice(-6);
		SBUxMethod.set("srch-dtp-outVhclTm",timePart); //입차시간
		SBUxMethod.set("srch-inp-rmrk",rowData.wghRmrk);
		SBUxMethod.set("srch-dtp-wghYmd",rowData.outTm);

	}


	const fn_search = async function(){
    	let postJsonPromise = gfn_postJSON("/am/wgh/selectWghEntrVhclList.do", {apcCd : gv_selectedApcCd});
        let data = await postJsonPromise;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	jsonWghFcltDtlList.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					let fcltVO = {
 							apcCd : item.apcCd
 							, fcltCd : item.fcltCd
 							, prcsCmptnDt : item.prcsCmptnDt
 							, prcsCmptnYn : item.prcsCmptnYn
 							, prcsTaskCd : item.prcsTaskCd
 							, vhclno : item.vhclno
 							, wghno : item.wghno
 							, wghDt : item.wghDt
 							, wghRmrk : item.wghRmrk
 							, wghSeq : item.wghSeq
 							, wghSeCd : item.wghSeCd
 							, delYn : item.delYn
 							, entrWght : item.entrWght
 							, outWght : item.outWght
 							, entrTm : item.entrTm
 							, outTm : item.outTm
 							, diff : parseInt(item.entrWght) - parseInt(item.outWght)
  					}

  					jsonWghFcltDtlList.push(fcltVO);
  				});
  	        	grdWghFcltDtlList.rebuild();

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_new = async function(){
		SBUxMethod.clearGroupData('group1');
	}



	const fn_save = async function(){
		let wghFclt = SBUxMethod.get("srch-slt-wghFcltCd");
		let wghNo = SBUxMethod.get("srch-inp-wghNo");
		let vhclNo = SBUxMethod.get("srch-inp-vhclNo");
		let entrVhclWght = SBUxMethod.get("srch-inp-outVhclWght"); //출차중량
		let entrVhclTm = SBUxMethod.get("srch-dtp-outVhclTm"); //출차시간
		let rmrk = SBUxMethod.get("srch-inp-rmrk");
		let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");

		if(gfn_nvl(wghFclt) === ""){
			return;
		}

		if(gfn_nvl(wghNo) === ""){
			return;
		}


		try{
			let obj = {
					apcCd : gv_selectedApcCd
					, wghno : wghNo
					, wghSeq : 2
					, vhclno : vhclNo
					, wghSeCd : '02' //출차
					, wghWght : entrVhclWght
					, wghDt : wghYmd + entrVhclTm
					, delYn : 'N'
					, wghRmrk : rmrk
					, wghYmd : wghYmd
					, prcsCmptnYn : 'N'
					, fcltCd : wghFclt
			}



            let postJsonPromise = gfn_postJSON("/am/wgh/insertWghOutVhcl.do",obj);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                	gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
                    fn_search();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }


	}


    const fn_delete = async function(){

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };
		let rowIdx = grdWghFcltDtlList.getRow();
        let rowData = grdWghFcltDtlList.getRowData(rowIdx);

        if(gfn_nvl(rowData) === ""){
        	return;
        }

        rowData['wghSeCd'] = "02";
        let postJsonPromise = gfn_postJSON("/am/wgh/deleteWghEntrVhcl.do",rowData);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                    gfn_comAlert("I0001");
                    fn_search();
                }
            };
        }catch (e){
            console.error(e);
        }
    }









    window.addEventListener("DOMContentLoaded",function(){
    	fn_createSortFcltDtlList();
    	fn_search();
        fn_init();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
