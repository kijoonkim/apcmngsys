<%
    /**
     * @Class Name : apcSftyMngChkListReg.jsp
     * @Description : 6. APC 안전관리 자가진단 체크리스트
     * @author SI개발부
     * @since 2025.10.04
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.10.04   	유민지		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid" style="height: 100vh">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- APC안전관리 자가진단 체크리스트 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
                <sbux-button id="btnTmprStrg" name="btnTmprStrg" uitype="normal" text="임시저장" class="btn btn-sm btn-outline-danger" onclick="fn_tmprStrg"></sbux-button>
                <sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[pp] 검색 -->
            <div>
                <table class="table table-bordered tbl_row tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <col style="width: 11%">
                    <col style="width: 22%">
                    <col style="width: 50px">
                    <col style="width: 11%">
                    <col style="width: 22%">
                    <col style="width: 187px">
                    <col style="width: 100px">
                    <tbody>
                    <tr>
                        <th scope="row" style="border-bottom:1px solid white " >APC명</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
                            <sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
                        </td>
                        <td>
                            <sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
                        </td>
                        <th scope="row">조사연도</th>
                        <td class="td_input"  style="border-right: hidden;">
                            <sbux-select
                                    id="srch-slt-crtrYr"
                                    name= "srch-slt-crtrYr"
                                    uitype="single"
                                    jsondata-ref="jsonCrtrYr"
                                    class="form-control input-sm"
                            ></sbux-select>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <br>
            <%-- 진척도 --%>
            <%@ include file="prgrs/apcPrgrs.jsp" %>
            <br>

            <div>
                <label style="font-weight: bold;">○APC 안전관리 자가진단 체크리스트</label>
            </div>

            <div>
                <table class="table table-bordered tbl_row tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 50%">
                        <col style="width: 20%">
                        <col style="width: 10%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th style="text-align: center">주요내용</th>
                        <th style="text-align: center">문항</th>
                        <th style="text-align: center">답변</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>시설설립연도</th>
                        <td >APC 최초 설립연도
                            <br>* 건물별로 설립연도 상이할 경우 가장 오래된 건물기준 작성</td>
                        <td class="td_input" style="border-right: hidden;" >
                            <sbux-input id="dtl-inp-picNm" name="dtl-inp-picNm" uitype="text" class="form-control input-sm" autocomplete ="off" permit-keycodes-set="num" minlength="4" maxlength="4"></sbux-input>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>책임자지정(안전)</th>
                        <td>APC 내에 안전보건을 관리하는 담당자 선임여부</td>
                        <td class="td_input" style="border-right: hidden;" colspan="2">
                            <sbux-radio id="rdo-rbprsnDsgnSftyY" name="rdo-rbprsnDsgnSfty" uitype="normal" value="Y"  class="radio_label" text="o"></sbux-radio>
                            <sbux-radio id="rdo-rbprsnDsgnSftyN" name="rdo-rbprsnDsgnSfty" uitype="normal" value="N" class="radio_label" text="x"></sbux-radio>
                        </td>
                    </tr>
                    <tr>
                        <th>책임자지정(소방)</th>
                        <td>APC 내에 소방안전을 관리하는 담당자 선임여부</td>
                        <td class="td_input" style="border-right: hidden;" colspan="2">
                            <sbux-radio id="rdo-rbprsnDsgnFrY" name="rdo-rbprsnDsgnFr" uitype="normal" value="Y"  class="radio_label" text="o"></sbux-radio>
                            <sbux-radio id="rdo-rbprsnDsgnFrN" name="rdo-rbprsnDsgnFr" uitype="normal" value="N" class="radio_label" text="x"></sbux-radio>
                        </td>
                    </tr>
                    <tr>
                        <th>위험성평가</th>
                        <td>당해연도 내 사업장의 유해·위험 요인을 파악하고 위험을 낮추기 위한 대책 수립 및 실행여부</td>
                        <td class="td_input" style="border-right: hidden;" colspan="2">
                            <sbux-radio id="rdo-riskEvlY" name="rdo-riskEvl" uitype="normal" value="Y"  class="radio_label" text="o"></sbux-radio>
                            <sbux-radio id="rdo-riskEvlN" name="rdo-riskEvl" uitype="normal" value="N" class="radio_label" text="x"></sbux-radio>
                        </td>
                    </tr>
                    <tr>
                        <th>안전보건교육</th>
                        <td>근로자 대상으로 안전보건교육 실시 여부</td>
                        <td class="td_input" style="border-right: hidden;" colspan="2">
                            <sbux-radio id="rdo-sftyEduY" name="rdo-sftyEdu" uitype="normal" value="Y"  class="radio_label" text="o"></sbux-radio>
                            <sbux-radio id="rdo-sftyEduN" name="rdo-sftyEdu" uitype="normal" value="N" class="radio_label" text="x"></sbux-radio>
                        </td>
                    </tr>
                    <tr>
                        <th>화재예방(관리)</th>
                        <td>매년 1회 이상(또는 반기별 1회) 소방시설 작동 점검 수행 여부</td>
                        <td class="td_input" style="border-right: hidden;" colspan="2">
                            <sbux-radio id="rdo-fireMngY" name="rdo-fireMng" uitype="normal" value="Y"  class="radio_label" text="o"></sbux-radio>
                            <sbux-radio id="rdo-fireMngN" name="rdo-fireMng" uitype="normal" value="N" class="radio_label" text="x"></sbux-radio>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
</section>
<div>
    <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:600px; z-index: 10000;"></sbux-modal>
</div>
<div id="body-modal-apcSelect">
    <jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">
    // 기준연도
    var jsonCrtrYr = [];

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    /* 초기세팅 */
    const fn_init = async function() {
        await fn_initSBSelect();

        await fn_selectUserApcList();//선택가능한 APC리스트 조회

        if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
            return;
        }

        //진척도
        // await cfn_selectPrgrs();
    }

    const fn_initSBSelect = async function() {
        await gfn_getApcSurveyCrtrYr('srch-slt-crtrYr',jsonCrtrYr); // 연도
    }

    /* 선택가능한 APC리스트 조회 */
    const fn_selectUserApcList = async function(){

        let postJsonPromise = gfn_postJSON("/fm/fclt/selectUserApcList.do", {

        });

        let data = await postJsonPromise;
        try{
            let apcListLength = data.resultList.length;
            if(apcListLength == 1){
                SBUxMethod.set("srch-inp-apcCd", data.resultList[0].apcCd);
                SBUxMethod.set("srch-inp-apcNm", data.resultList[0].apcNm);
            }else if (apcListLength > 1){
                //APC선택 팝업 열기
                fn_modalApcSelect();
                SBUxMethod.openModal("modal-apcSelect");
            }
        }catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    // apc 선택 팝업 호출
    const fn_modalApcSelect = function() {
        popApcSelect.init(fn_setApc);
    }

    // apc 선택 팝업 콜백 함수
    const fn_setApc = async function(apc) {
        if (!gfn_isEmpty(apc)) {
            SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
            SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
        }
        //진척도 갱신
        // await cfn_selectPrgrs();
        // await fn_search();
    }

    //최종제출 여부 체크
    function fn_prgrsLastChk(){
        //최종제출 여부
        let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
        if(prgrsLast  == 'Y'){
            SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
            SBUxMethod.attr("btnTmprStrg",'disabled','true'); // 임시저장버튼 비활성화

        } else {
            SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
            SBUxMethod.attr("btnTmprStrg",'disabled','false'); // 임시저장버튼 활성화
        }
    }

</script>
</html>