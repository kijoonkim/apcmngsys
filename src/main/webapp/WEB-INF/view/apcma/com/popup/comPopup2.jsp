<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body oncontextmenu="return false">
<section id="compopup2">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <table class="table table-bordered tbl_row tbl_fixed">
                    <colgroup>
                        <col style="width: 25%">
                        <col style="width: 25%">
                        <col style="width: 25%">
                        <col style="width: 25%">
                    </colgroup>
                    <tr>
                        <th colspan="2" scope="row" class="th_bg">보험년월</th>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="pay_yyyymm"
                                    name="pay_yyyymm"
                                    uitype="popup"
                                    datepicker-mode="month"
                                    date-format="yyyymm"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    required>
                                <%--onchange="fn_payDate"--%>
                            </sbux-datepicker>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2" scope="row" class="th_bg">지급구분</th>
                        <td colspan="2" class="td_input">
                            <sbux-select
                                    id="pay_type"
                                    uitype="single"
                                    jsondata-ref="jsonPayType"
                                    unselected-text="선택"
                                    class="form-control input-sm inpt_data_reqed">
                            </sbux-select>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2" scope="row" class="th_bg">지금일</th>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="pay_date"
                                    name="pay_date"
                                    uitype="popup"
                                    date-format="yyyymmdd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    >
                            </sbux-datepicker>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-right: hidden;"></td>
                        <td colspan="2" class="td_input" style="text-align:right;" >
                            <div>
                                <sbux-button uitype="normal" text="확인" class="btn btn-sm btn-outline-danger cu-btn-sch-compopup2" ></sbux-button>
                                <sbux-button uitype="normal" text="취소" class="btn btn-sm btn-outline-danger cu-btn-close-compopup2" ></sbux-button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
<script>
 
    jsonPayType = [];
 
    /**
     * @description 공통 팝업
     */
    function compopup2(options) {
 
        // id 선언
        var modalId = '#compopup2';
        var modalDivId = 'modal-compopup2';
 
        var settings = {
            yyyymm: null
            , payAreaType: null
            , compCode: null
            , clientCode: null
            , bizcompId: null
            , code: null
            , name: null
            , itemSelectEvent: null
        };
        $.extend(settings, options);
 
 
        var settingTable = function() {
            SBUxMethod.set("pay_yyyymm", settings.yyyymm);
        }
 
        settingTable();
 
        const fn_initSBSelect = async function () {
            let rst = await Promise.all([
                gfnma_setComSelect(['pay_type'], jsonPayType, settings.bizcompId, '', settings.compCode, settings.clientCode, settings.code, settings.name, 'Y', '')
            ]);
        }
 
        fn_initSBSelect();
 
        // get data
        const getData = async function() {
 
            let pay_yyyymm = gfnma_nvl(SBUxMethod.get("pay_yyyymm")); //급여년월
            let pay_type = gfnma_nvl(SBUxMethod.get("pay_type")); //지급구분
            let pay_date = gfnma_nvl(SBUxMethod.get("pay_date")); //지급일
 
            if (!pay_yyyymm) {
                gfn_comAlert("W0002", "급여년월");
                return;
            }
            if (!pay_type) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }
            if (!pay_date) {
                gfn_comAlert("W0002", "지급일");
                return;
            }
 
            var obj = {
                pay_yyyymm : pay_yyyymm
                ,pay_type : pay_type
                ,pay_date : pay_date
            };
 
            if(settings.itemSelectEvent){
                settings.itemSelectEvent(obj);
            }
 
            SBUxMethod.closeModal(modalDivId);
 
        }
 
        //search button event
        $(modalId).find('.cu-btn-sch-compopup2').click(function(){
            getData();
        });
 
        //close event
        $(modalId).find('.cu-btn-close-compopup2').click(function(){
            SBUxMethod.closeModal(modalDivId);
        });
 
    }
</script>
</html>
